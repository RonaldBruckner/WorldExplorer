import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import '../../data/models/country.dart';
import '../../data/models/openweather_forecast_day.dart';
import '../../data/repositories/country_repository.dart';
import '../../data/api/geocoding_helper.dart';
import '../../tools/location_helper.dart';
import '../../tools/tools.dart';


class CountryViewModel extends ChangeNotifier with WidgetsBindingObserver {
  final CountryRepository _repository;
  final GeocodingHelper _geocoding;

  static String TAG = "CountryViewModel";

  Timer? _pollingTimer;

  bool _hasInitialized = false;
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
  Map<String, String>? currencySymbols;
  String? fromCurrency;
  String? toCurrency;
  double? exchangeRate;
  bool isGpsMode = true;
  bool rateError = false;
  String? error;


  CountryViewModel(this._repository, this._geocoding);

  void initLifecycle() {
    WidgetsBinding.instance.addObserver(this);
  }

  void disposeLifecycle() {
    WidgetsBinding.instance.removeObserver(this);
  }


    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
      Tools.logDebug(TAG, 'didChangeAppLifecycleState: $isGpsMode ');
      if (state == AppLifecycleState.resumed && isGpsMode) {
        _onAppResumed();
      }
    }

  void _onAppResumed() async {
    await loadCountryData(lat: 0, lon: 0);
  }

  // Optionally inject these via constructor if needed
  Future<void> checkAndLoadRequirements(BuildContext context) async {
    if (_hasInitialized) return;
    _hasInitialized = true;

    final hasInternet = await Tools.checkInternet();
    var hasGPS = await Tools.checkGPS(); // mutable

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {

      final agreed = await Tools.showLocationPermissionDialog(context);
      if (agreed) {
        permission = await Geolocator.requestPermission();
      }

      // If user declined, fail
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        return Tools.showMissingRequirementsDialog(context, hasInternet, false);
      }

      hasGPS = await Tools.checkGPS();
    }

    if (!hasInternet || !hasGPS) {
      return Tools.showMissingRequirementsDialog(context, hasInternet, hasGPS);
    }

    await loadCountryData( lat: 0, lon: 0);
  }

  Future<void> loadCountryData({required double lat, required double lon}) async {
    try {

      bool updateAll =true;

      if (lat == 0 && lon == 0) {
        isGpsMode = true;
        if(_pollingTimer==null) {
          startLocationPolling();
        }
        if(country!=null) {
          updateAll = false;
        }
      } else {
        isGpsMode = false;
        stopLocationPolling();
      }

      if(lat != previousLatitude && lon != previousLongitude) {
        previousLatitude = lat;
        previousLongitude = lon;
        updateAll = true;
      }

      Tools.logDebug(TAG, 'loadCountryData: $lat , $lon, updateAll: $updateAll');

      if(updateAll) {
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

        notifyListeners();
      }

      if(lat==0 && lon==0) {
        final pos = await LocationHelper.getCurrentPosition();
        latitude = pos.latitude;
        longitude =  pos.longitude;
      } else {
        latitude = lat;
        longitude = lon;
      }


      final info = await _geocoding.getCountryInfo(latitude!, longitude!);

      //Tools.logDebug(TAG, 'loadCountryData info: $info');

      if(info!=null) {
        countryName = info["name"];
        countryCode = info["code"];
        city = info["city"];
        address = info["address"];
        notifyListeners();
      }

      if(updateAll) {
        country = await _repository.getCountryDetails(countryCode!);

        if (city == null || city!.isEmpty) {
          city = country?.capital;
        }

        notifyListeners();

        final result = await _repository.getWeatherForecast(latitude, longitude);
        forecast = result;
        utcOffset = result.isNotEmpty ? result.first.utcOffset : null;
        notifyListeners();

        currencySymbols = await _repository.getCurrencySymbols();
        fromCurrency = await _repository.getCurrencyFromCountryCode(countryCode!);

        toCurrency ??= 'EUR';
        if (currencySymbols!.containsKey(toCurrency)) {
          await updateExchangeRate(fromCurrency!, toCurrency!);
        }


      }

    } catch (e) {
      //Tools.logDebug('loadCountryData failed', e, stack);
      error = e.toString();
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
