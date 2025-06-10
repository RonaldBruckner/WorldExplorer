import 'package:WorldExplorer/data/models/country.dart';
import 'package:WorldExplorer/data/repositories/country_repository.dart';
import 'package:WorldExplorer/data/api/geocoding_helper.dart';
import 'country_view_model_test.mocks.dart';
import 'package:WorldExplorer/presentation/viewmodels/country_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([CountryRepository, GeocodingHelper])
void main() {
  late MockCountryRepository mockRepo;
  late MockGeocodingHelper mockGeocoding;
  late CountryViewModel viewModel;

  setUp(() {
    mockRepo = MockCountryRepository();
    mockGeocoding = MockGeocodingHelper();

    viewModel = CountryViewModel(mockRepo,mockGeocoding);
  });

  test('loadCountryData sets correct country info', () async {

    when(mockGeocoding.getCountryInfo(any, any)).thenAnswer((_) async => {
      "name": "Austria",
      "code": "AT",
      "city": "Vienna",
      "address": "Vienna, Austria",
    });
    // Arrange
    final mockCountry = Country(
      countryCode: 'AT',
      name: 'Austria',
      capital: 'Vienna',
      population: 9000000,
      languages: ['German'],
    );

    when(mockRepo.getCountryDetails(any)).thenAnswer((invocation) async {
      final code = invocation.positionalArguments.first as String;
      expect(code, isNotNull);
      return mockCountry;
    });

    when(mockRepo.getWeatherForecast(any, any)).thenAnswer((_) async => []);
    when(mockRepo.getCurrencySymbols()).thenAnswer((_) async => {});
    when(mockRepo.getCurrencyFromCountryCode(any)).thenAnswer((_) async => 'EUR');

    // Act
    await viewModel.loadCountryData(lat: 48.2, lon: 16.3);

    // Assert
    expect(viewModel.countryCode, 'AT');
    expect(viewModel.countryName, 'Austria');
    expect(viewModel.country?.capital, 'Vienna');
    verify(mockRepo.getCountryDetails('AT')).called(1);
  });

  test('sets error if getCountryDetails throws', () async {
    when(mockGeocoding.getCountryInfo(any, any)).thenAnswer((_) async => {
      "name": "Austria",
      "code": "AT",
      "city": "Vienna",
      "address": "Vienna, Austria",
    });

    when(mockRepo.getCountryDetails(any)).thenThrow(Exception('Network error'));

    await viewModel.loadCountryData(lat: 1.0, lon: 1.0);

    expect(viewModel.error, contains('Exception'));
  });

  test('loads from local DB if available', () async {
    final country = Country(
      countryCode: 'AT',
      name: 'Austria',
      capital: 'Vienna',
      population: 9000000,
      languages: ['German'],
    );

    when(mockGeocoding.getCountryInfo(any, any)).thenAnswer((_) async => {
      "name": "Austria",
      "code": "AT",
      "city": "Vienna",
      "address": "Vienna, Austria",
    });
    // Simulate local DB having the data
    when(mockRepo.getCountryDetails('AT')).thenAnswer((_) async => country);
    when(mockRepo.getWeatherForecast(any, any)).thenAnswer((_) async => []);
    when(mockRepo.getCurrencySymbols()).thenAnswer((_) async => {});
    when(mockRepo.getCurrencyFromCountryCode(any)).thenAnswer((_) async => 'EUR');

    await viewModel.loadCountryData(lat: 1.0, lon: 1.0);

    expect(viewModel.country?.capital, 'Vienna');
  });

  test('sets rateError to true when updateExchangeRate fails', () async {
    when(mockRepo.getExchangeRate(any, any)).thenThrow(Exception('API failed'));

    await viewModel.updateExchangeRate('USD', 'EUR');

    expect(viewModel.rateError, isTrue);
    expect(viewModel.exchangeRate, isNull);
  });
}