import 'package:flutter/foundation.dart';
import '../../data/models/country.dart';
import '../../data/models/openweather_forecast_day.dart';
import '../../data/repositories/country_repository.dart';
import '../../data/api/geocoding_helper.dart';
import '../../tools/location_helper.dart';

class CountryViewModel extends ChangeNotifier {
  final CountryRepository _repository;
  final GeocodingHelper _geocoding;
  // State
  String? countryCode;
  String? countryName;
  String? city;
  String? address;
  double? latitude;
  double? longitude;
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

  Future<void> loadCountryData({required double lat, required double lon}) async {
    try {
      // Reset state
      error = null;
      forecast = null;
      country = null;
      countryName = null;
      countryCode  = null;
      city  = null;
      address = null;
      fromCurrency = null;
      toCurrency = null;
      exchangeRate = null;
      rateError = false;
      isGpsMode = false;
      latitude = null;
      longitude = null;
      utcOffset = null;

      notifyListeners();

      if(lat==0 && lon==0) {
        final pos = await LocationHelper.getCurrentPosition();
        lat = pos.latitude;
        lon =  pos.longitude;
        isGpsMode = true;
      }

      latitude = lat;
      longitude = lon;

      final info = await _geocoding.getCountryInfo(lat, lon);

      if(info!=null) {
        countryName = info["name"];
        countryCode = info["code"];
        city = info["city"];
        address = info["address"];
        notifyListeners();
      }

      country = await _repository.getCountryDetails(countryCode!);
      notifyListeners();

      final result = await _repository.getWeatherForecast(lat, lon);
      forecast = result;
      utcOffset = result.isNotEmpty ? result.first.utcOffset : null;
      notifyListeners();

      currencySymbols = await _repository.getCurrencySymbols();
      fromCurrency = await _repository.getCurrencyFromCountryCode(countryCode!);

      // Load saved target currency fallback
      toCurrency ??= 'EUR';
      if (currencySymbols!.containsKey(toCurrency)) {
        await updateExchangeRate(fromCurrency!, toCurrency!);
      }

    } catch (e) {
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
}
