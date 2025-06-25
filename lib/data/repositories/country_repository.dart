import 'package:flutter/cupertino.dart';

import '../../tools/tools.dart';
import '../api/country_api_client.dart';
import '../api/currency_api_client.dart';
import '../api/openweather_api_client.dart';
import '../local/country_database.dart';
import '../models/country.dart';
import '../models/openweather_forecast_day.dart';

class CountryRepository {

  static String TAG = "CountryRepository";

  final CountryApiClient _countryApiClient;
  final CountryDatabase _countryDB;

  final CurrencyApiService _currencyApi;
  final OpenWeatherApiClient _weatherApi;

  CountryRepository(this._countryApiClient, this._countryDB, this._currencyApi, this._weatherApi);

  // Fetch country data by code
  Future<Country> getCountryDetails(String? countryCode) async {

    final local = await _countryDB.getCountryByCode(countryCode);
    if (local != null) {
      return local;
    }
      final remote = await _countryApiClient.fetchCountryByCode(countryCode);
      await _countryDB.saveCountry(remote);
      return remote;
  }

  // Fetch 4-day weather forecast
  Future<List<ForecastDay>?> getWeatherForecast(double? lat, double? lon) {
    return _weatherApi.get4DayForecast(lat, lon);
  }

  // Get available currency symbols
  Future<Map<String, String>> getCurrencySymbols() async {
    final cachedSymbols = await _countryDB.getCurrencySymbols();
    if (cachedSymbols != null && cachedSymbols.isNotEmpty) {
      return cachedSymbols;
    }

    final symbols = await _currencyApi.getCurrencySymbols();
    await _countryDB.saveCurrencySymbols(symbols);
    return symbols;
  }

  // Get currency code from country code (e.g., "US" → "USD")
  Future<String> getCurrencyFromCountryCode(String? countryCode) async {
    final cached = await _countryDB.getCurrencyForCountry(countryCode);
    if (cached != null) {
      return cached;
    }

    final currency = await _currencyApi.getCurrencyFromCountryCode(countryCode);
    await _countryDB.saveCurrencyForCountry(countryCode, currency);
    return currency;
  }

  // Get exchange rate
  Future<double> getExchangeRate(String fromCurrency, String toCurrency) async {
    if (fromCurrency == toCurrency) return 1.0;
    return await _currencyApi.getExchangeRate(fromCurrency, toCurrency);
  }
}
