import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class CurrencyApiService {

  Future<Map<String, String>> getCurrencySymbols() async {
    final response = await http.get(Uri.parse('https://api.frankfurter.app/currencies'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return data.map((code, name) => MapEntry(code, name.toString()));
    } else {
      throw Exception('Failed to load currency symbols');
    }
  }

  Future<double> getExchangeRate(String from, String to) async {
    final url = Uri.parse('https://api.frankfurter.app/latest?from=$from&to=$to');
    debugPrint('getExchangeRate: $url');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['rates'][to] as num).toDouble();
    } else {
      throw Exception('Failed to fetch exchange rate');
    }
  }

  Future<String> getCurrencyFromCountryCode(String? countryCode) async {
    final url = Uri.parse('https://restcountries.com/v3.1/alpha/$countryCode');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      debugPrint(json.encode(data));

      if (data.isEmpty || data.first['currencies'] == null) {
        throw Exception('No currency found for country code: $countryCode');
      }

      final currencies = data.first['currencies'] as Map<String, dynamic>;
      return currencies.keys.first;
    } else {
      throw Exception('Failed to fetch currency for country code: $countryCode');
    }
  }
}