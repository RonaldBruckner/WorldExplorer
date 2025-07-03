import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import '../../data/api/places_api_client.dart';
import '../../data/models/country.dart';
import '../../data/models/openweather_forecast_day.dart';
import '../../data/repositories/country_repository.dart';
import '../../data/api/geocoding_helper.dart';
import '../../tools/location_helper.dart';
import '../../tools/tools.dart';
import '../../tools/shared_preferences_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountryViewModel extends ChangeNotifier with WidgetsBindingObserver {
  static String TAG = "CountryViewModel";

  final CountryRepository _repository;
  final GeocodingHelper _geocoding;

  Timer? _pollingTimer;

  // State
  String? countryCode;
  String? countryName;
  String? city;
  String? address;
  double? latitude;
  double? longitude;
  double? previousLatitude;
  double? previousLongitude;
  int? utcOffset;
  Country? country;
  List<ForecastDay>? forecast;
  bool forecastError = false;

  Map<String, String>? currencySymbols;
  String? fromCurrency;
  String? toCurrency;
  double? exchangeRate;
  bool isGpsMode = true;
  bool rateError = false;
  bool hasInternet = true;
  String? error;

  List<Map<String, dynamic>>? nearbyAttractions;
  bool attractionsError = false;

  String? noInternetMessage;

  CountryViewModel(this._repository, this._geocoding);

  void initLifecycle() {
    WidgetsBinding.instance.addObserver(this);
  }

  void disposeLifecycle() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //Tools.logDebug(TAG, 'didChangeAppLifecycleState: $isGpsMode ');
    if (state == AppLifecycleState.resumed && isGpsMode) {
      _onAppResumed();
    }
  }

  void _onAppResumed() async {
    // Wait a bit to avoid conflicting with immediate manual interactions
    await Future.delayed(const Duration(milliseconds: 200));
    if (!isGpsMode) return;

    if(hasInternet) {
      await loadCountryData(lat: 0, lon: 0);
    }
  }


  Future<void> checkAndLoadRequirements(BuildContext context) async {

    hasInternet = await Tools.checkInternet();

    if (!hasInternet) {
      error = AppLocalizations.of(context)!.internet_unavailable;
      notifyListeners();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    Tools.logDebug("Tools", 'LocationPermission: $permission');


    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {

      final agreed = await Tools.showLocationPermissionDialog(context);

      if (agreed) {
        permission = await Geolocator.requestPermission();

        Tools.logDebug("Tools", 'showLocationPermissionDialog permission: ''$permission');
        if (permission == LocationPermission.deniedForever) {
          if (Platform.isAndroid) {
            await Geolocator.openAppSettings();
            return;
          } else if (Platform.isIOS) {
            await openAppSettings(); // from url_launcher
            return;
          }
        }
        if (permission != LocationPermission.always &&
            permission != LocationPermission.whileInUse ) {
          await loadInitialData();
          await loadCountryData(lat: latitude!, lon: longitude!);
          return;
        }
      } else {
        await loadInitialData();
        await loadCountryData(lat: latitude!, lon: longitude!);
        return;
      }
    }

    await loadCountryData(lat: 0, lon: 0);
  }

  Future<void> loadInitialData() async {
    isGpsMode = false;
    stopLocationPolling();
    // Load last selected location from SharedPreferences
    final lastLocation = await SharedPreferencesHelper.getSelectedLocation();
    if (lastLocation != null && lastLocation['latitude'] != 0.0 && lastLocation['longitude'] != 0.0) {
      latitude = lastLocation['latitude'];
      longitude = lastLocation['longitude'];
    } else {
      latitude = 52.5200; // Default to Berlin
      longitude = 13.4050;
    }

  }


  Future<void> loadCountryData({required double lat, required double lon}) async {
    try {
      Tools.logDebug("Tools", 'loadCountryData isGpsMode: $isGpsMode lat: $lat, lon: $lon');

      // Determine and set mode
      final wasGpsMode = isGpsMode;

      if (lat == 0 && lon == 0) {
        isGpsMode = true;
        if (_pollingTimer == null) startLocationPolling();
      } else {
        isGpsMode = false;
        stopLocationPolling();
        await SharedPreferencesHelper.saveSelectedLocation(lat, lon);
      }

      // Ignore outdated GPS loads after switching to manual
      if (!isGpsMode && lat == 0 && lon == 0) {
        Tools.logDebug(TAG, 'Ignored outdated GPS update after manual selection');
        return;
      }

      // Determine whether to refresh all data
      // if country is selected from the list !isGpsMode
      // initial load country==null
      // gps mode was false but now is true
      bool updateAll = false;
      if (!isGpsMode || country==null || (isGpsMode && !wasGpsMode)) {
        updateAll = true;
      }

      if (updateAll) {
        // Reset state
        error = null;
        forecast = null;
        country = null;
        countryName = null;
        countryCode = null;
        city = null;
        address = null;
        fromCurrency = null;
        toCurrency = null;
        exchangeRate = null;
        rateError = false;
        latitude = null;
        longitude = null;
        utcOffset = null;
        nearbyAttractions = null;

        notifyListeners();
      }

      // Update position
      if (isGpsMode) {
        final pos = await LocationHelper.getCurrentPosition();
        if (pos != null) {
          latitude = pos.latitude;
          longitude = pos.longitude;
        } else {
          await loadInitialData();
        }
      } else {
        latitude = lat;
        longitude = lon;
      }

      // Cache previous location
      previousLatitude = latitude;
      previousLongitude = longitude;

      final info = await _geocoding.getCountryInfo(latitude!, longitude!);
      final oldCity = city;

      if (info != null) {
        countryName = info["name"];
        countryCode = info["code"];
        city = info["city"];
        address = info["address"];
        notifyListeners();
      } else {
        error = 'Failed to load location information.';
        notifyListeners();
        return;
      }

      if(oldCity!=city) {
        updateAll=true;
      }

      if (updateAll) {
        country = await _repository.getCountryDetails(countryCode!);
        if (city == null || city!.isEmpty) {
          city = country?.capital;
        }

        notifyListeners();

        await loadNearbyAttractions();

        final result = await _repository.getWeatherForecast(latitude!, longitude!);
        if (result != null) {
          forecast = result;
          utcOffset = result.isNotEmpty ? result.first.utcOffset : null;
        } else {
          forecastError = true;
        }
        notifyListeners();

        currencySymbols = await _repository.getCurrencySymbols();
        fromCurrency = await _repository.getCurrencyFromCountryCode(countryCode!);
        toCurrency ??= 'EUR';

        if (currencySymbols!.containsKey(toCurrency)) {
          await updateExchangeRate(fromCurrency!, toCurrency!);
        }
      }
    } catch (e, stack) {
      error = e.toString();
      Tools.logDebug(TAG, error!);
      Tools.logDebug(TAG, stack.toString());
      // Log to Crashlytics
      try {
        await FirebaseCrashlytics.instance.recordError(e, stack, reason: 'loadCountryData exception');
      } catch (_) {}
      notifyListeners();
    }
  }

  Future<void> updateExchangeRate(String from, String to) async {
    try {
      rateError = false;
      exchangeRate = null;
      fromCurrency = from;
      toCurrency = to;
      notifyListeners();

      exchangeRate = await _repository.getExchangeRate(from, to);
    } catch (e) {
      rateError = true;
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadNearbyAttractions() async {
    if (latitude == null || longitude == null) return;
    nearbyAttractions = await PlacesApiClient().getNearbyAttractions(latitude!, longitude!);
    if(nearbyAttractions== null) {
      attractionsError=true;
    }
    notifyListeners();
  }

  Future<void> openMapForCurrentLocation() async {
    if (latitude == null || longitude == null) return;

    final lat = latitude;
    final lon = longitude;

    final url = Platform.isIOS
        ? 'http://maps.apple.com/?ll=$lat,$lon'
        : 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';

    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  DateTime getLocalTime() {
    if (utcOffset == null) return DateTime.now();
    final now = DateTime.now().toUtc(); // current UTC time
    return now.add(Duration(seconds: utcOffset!));
  }

  void startLocationPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 60), (_) async {
      await loadCountryData(lat: 0, lon: 0);
    });
  }

  void stopLocationPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    disposeLifecycle();
    super.dispose();
  }
}
