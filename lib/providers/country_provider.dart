import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/country_repository.dart';
import '../data/api/country_api_client.dart';
import '../data/api/currency_api_client.dart';
import '../data/api/openweather_api_client.dart';
import '../data/local/country_database.dart';

// ApiClient Provider
final countryApiClientProvider = Provider<CountryApiClient>((ref) {
  return CountryApiClient();
});

// Database Provider
final countryDatabaseProvider = Provider<CountryDatabase>((ref) {
  return CountryDatabase();
});

// ApiClient Provider
final currencyApiServiceProvider = Provider<CurrencyApiService>((ref) {
  return CurrencyApiService();
});

// Database Provider
final openWeatherApiClientProvider = Provider<OpenWeatherApiClient>((ref) {
  return OpenWeatherApiClient();
});

final countryRepositoryProvider = Provider<CountryRepository>((ref) {

  final countryApiClient = ref.read(countryApiClientProvider);
  final countryDatabase = ref.read(countryDatabaseProvider);
  final currencyApiService = ref.read(currencyApiServiceProvider);
  final openWeatherApiClient = ref.read(openWeatherApiClientProvider);

  return CountryRepository(countryApiClient,countryDatabase,currencyApiService,openWeatherApiClient);
});