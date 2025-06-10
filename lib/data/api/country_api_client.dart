// lib/features/countries/data/api/country_api_client.dart
import 'package:dio/dio.dart';

import '../models/country.dart';

class CountryApiClient {
  final Dio _dio;

  CountryApiClient({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Country>> fetchAllCountries() async {
    final response = await _dio.get('https://restcountries.com/v3.1/all');
    if (response.statusCode == 200) {
      final data = response.data as List;
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<Country> fetchCountryByCode(String? code) async {
    final response = await _dio.get('https://restcountries.com/v3.1/alpha/$code');
    if (response.statusCode == 200) {
      final data = response.data;
      // RESTCountries returns a List for alpha-2/alpha-3
      final countryJson = data is List ? data[0] : data;
      return Country.fromJson(countryJson);
    } else {
      throw Exception('Failed to load country with code $code');
    }
  }
}
