import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/country_view_model_provider.dart';
import '../widgets/background_scaffold.dart';
import '../widgets/country_overview_header.dart';
import '../widgets/currency_converter.dart';
import '../widgets/emergency_numbers_widget.dart';
import '../widgets/nearby_attractions_widget.dart';
import '../widgets/weather_forecast_overview.dart';

class CountryPage extends ConsumerStatefulWidget {
  const CountryPage({super.key});

  @override
  ConsumerState<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends ConsumerState<CountryPage> {
  bool _requirementsChecked = false;

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(countryViewModelProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_requirementsChecked && model.latitude == null && model.longitude == null && model.error == null) {
        _requirementsChecked = true;
        ref.read(countryViewModelProvider).checkAndLoadRequirements(context);
      }
    });

    // Show full-screen error if model.error is set and nothing else loaded
    if (model.error != null ) {
      return BackgroundScaffold(
        title: '',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.missing_requirements, // Use a generic error title
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                model.error!,
                style: const TextStyle(color: Colors.black87, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    } else if (model.latitude == null || model.longitude == null) {
      return BackgroundScaffold(
        title: '',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.getting_gps_location),
            ],
          ),
        ),
      );
    } else if (model.countryCode == null || model.countryName == null) {
      return BackgroundScaffold(
        title: '',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.loading_country_info),
            ],
          ),
        ),
      );
    }

    return BackgroundScaffold(
      title: '',
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: model.error != null
            ? Center(child: Text(model.error!, style: const TextStyle(color: Colors.red)))
            : SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CountryOverviewHeader(
                countryCode: model.countryCode!,
                countryName: model.countryName!,
                country: model.country,
                utcOffset: model.utcOffset,
                isGpsMode: model.isGpsMode,
                onCountrySelected: (selected) async {

                  if (selected == null) {
                    await model.loadCountryData(lat: 0, lon: 0);
                  } else {
                    await model.loadCountryData(
                      lat: selected['lat'],
                      lon: selected['lng']
                    );
                  }
                },
                onSvgTap: model.openMapForCurrentLocation,
              ),
              const SizedBox(height: 8),

              NearbyAttractionsWidget(
                  attractions: model.nearbyAttractions,
                  attractionsError: model.attractionsError,
                  cityName: model.city
              ),
              const SizedBox(height: 16),
              WeatherForecastOverview(
                forecast: model.forecast,
                currentCityName: model.city ?? '',
                forecastError: model.forecastError,
              ),
              const SizedBox(height: 16),
              CurrencyConverter(
                currencySymbols: model.currencySymbols,
                fromCurrency: model.fromCurrency,
                toCurrency: model.toCurrency,
                exchangeRate: model.exchangeRate,
                rateError: model.rateError,
                onCurrencyChanged: model.updateExchangeRate,
              ),
              const SizedBox(height: 16),
              EmergencyNumbersWidget(
                countryCode: model.countryCode!,
                address: model.address!,
                latitude: model.latitude!,
                longitude: model.longitude!,
                gpsMode: model.isGpsMode,
                onTap: model.openMapForCurrentLocation,
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
