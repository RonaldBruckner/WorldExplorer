import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart';
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
  final String _languageCode;

  static String TAG = "CountryViewModel";

  Timer? _pollingTimer;
  Timer? _clockTimer;

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

  List<String>? countryFacts;
  String? currentFact;
  DateTime? currentTime;
  Timer? _factTimer;
  int _factIndex = 0;

  CountryViewModel(this._repository, this._geocoding, this._languageCode);

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
        currentTime = getLocalTime();
        notifyListeners();

        _clockTimer?.cancel();
        _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
          currentTime = getLocalTime();
          notifyListeners(); // to trigger time update in UI
        });

        currencySymbols = await _repository.getCurrencySymbols();
        fromCurrency = await _repository.getCurrencyFromCountryCode(countryCode!);

        toCurrency ??= 'EUR';
        if (currencySymbols!.containsKey(toCurrency)) {
          await updateExchangeRate(fromCurrency!, toCurrency!);
        }

        await loadCountryFacts(countryCode!);
      }

    } catch (e) {
      //Tools.logDebug('loadCountryData failed', e, stack);
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> loadCountryFacts(String countryCode) async {
    try {
      final language = _languageCode == 'de' ? 'de' : 'en';
      final jsonString = await rootBundle.loadString('assets/country_facts_$language.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      final factsList = jsonMap['fact_${countryCode.toLowerCase()}'] as List<dynamic>?;
      if (factsList != null && factsList.isNotEmpty) {
        countryFacts = factsList.cast<String>();
        _factIndex = Random().nextInt(countryFacts!.length);
        currentFact = countryFacts![_factIndex];
        Tools.logDebug(TAG,'loadCountryFacts currentFact $currentFact');
        _startFactRotation();
        notifyListeners();
      }
    } catch (e, stack) {
      Tools.logDebug(TAG, 'loadCountryFacts failed: $e\n$stack');
      countryFacts = null;
      currentFact = null;
      notifyListeners();
    }
  }

  void _startFactRotation() {
    _factTimer?.cancel();
    _factTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (countryFacts != null && countryFacts!.isNotEmpty) {
        _factIndex = (_factIndex + 1) % countryFacts!.length;
        currentFact = countryFacts![_factIndex];
        Tools.logDebug(TAG,'_startFactRotation currentFact $currentFact');
        notifyListeners();
      }
    });
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
    _factTimer?.cancel();
    _clockTimer?.cancel();
    disposeLifecycle();
    super.dispose();
  }
}
