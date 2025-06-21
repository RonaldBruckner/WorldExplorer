import 'package:world_explorer/providers/country_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:world_explorer/presentation/pages/country_page.dart';
import 'package:world_explorer/presentation/viewmodels/country_view_model.dart';
import 'package:world_explorer/data/repositories/country_repository.dart';
import 'package:world_explorer/data/api/geocoding_helper.dart';

// Fake GeocodingHelper
class FakeGeocodingHelper extends GeocodingHelper {
  @override
  Future<Map<String, String>?> getCountryInfo(double lat, double lon) async {
    return {
      "name": "Austria",
      "code": "AT",
      "city": "Vienna",
      "address": "Vienna, Austria",
    };
  }
}

// Fake CountryRepository with failing exchange rate
class FakeCountryRepository extends CountryRepository {
  FakeCountryRepository() : super(
    throw UnimplementedError(), // CountryApiClient
    throw UnimplementedError(), // CountryDatabase
    throw UnimplementedError(), // CurrencyApiService
    throw UnimplementedError(), // OpenWeatherApiClient
  );

  @override
  Future<double> getExchangeRate(String fromCurrency, String toCurrency) {
    throw Exception('Simulated API failure');
  }

// You can override other methods with dummy returns if needed
}

void main() {
  testWidgets('shows error UI when rateError is true', (WidgetTester tester) async {
    final viewModel = CountryViewModel(
      FakeCountryRepository(),
      FakeGeocodingHelper(),
    );

    await viewModel.updateExchangeRate('USD', 'EUR'); // triggers the failure

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          countryViewModelProvider.overrideWith((ref) => viewModel),
        ],
        child: const MaterialApp(home: CountryPage()),
      ),
    );

    await tester.pumpAndSettle();

    // Replace with your actual error message shown in the widget
    expect(
      find.byWidgetPredicate(
            (widget) =>
        widget is Text &&
            (widget.data?.contains('Währung') == true ||
                widget.data?.contains('Currency') == true),
      ),
      findsOneWidget,
    );
  });
}