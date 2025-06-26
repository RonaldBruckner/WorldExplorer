import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import '../../tools/tools.dart';

class GeocodingHelper {
  static String TAG = "GeocodingHelper";

  Future<Map<String, String>?> getCountryInfo(double lat, double lng) async {
    try {
      final language = WidgetsBinding.instance.platformDispatcher.locale.languageCode;

      //Tools.logDebug(TAG,'GeocodingHelper language: $language');

      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${Constants.mapsApiKey}&language=$language',
      );

      //Tools.logDebug(TAG,'GeocodingHelper url: $url');

      final response = await http.get(url).timeout(const Duration(seconds: Constants.API_TIMEOUT_IN_S));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          String? countryName;
          String? countryCode;
          String? cityName;
          String? formattedAddress;

          for (var result in data['results']) {
            for (var component in result['address_components']) {
              if (component['types'].contains('country')) {
                countryName = component['long_name'];
                countryCode = component['short_name'];
              }
              if (component['types'].contains('locality')) {
                cityName = component['long_name'];
              }
            }

            if (countryName != null && countryCode != null && cityName != null) {
              formattedAddress = result['formatted_address'];
              break;
            }
          }

          Tools.logDebug(TAG,'getCountryInfo cityName: $cityName');

          if (countryName != null && countryCode != null) {
            formattedAddress ??= data['results'][0]['formatted_address'] ?? '';
            return {
              'name': countryName,
              'code': countryCode,
              'city': cityName ?? '',
              'address': formattedAddress ?? ''
            };
          }
        } else {
          throw Exception('Geocoding error: ${data['status']}');
        }
      } else {
        throw Exception('HTTP error: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      Tools.logDebug(TAG,'getCountryInfo failed: $e');
      Tools.logDebug(TAG,stackTrace.toString());
    }

    return null;
  }
}
