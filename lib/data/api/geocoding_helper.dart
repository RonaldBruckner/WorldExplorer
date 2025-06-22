import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../tools/tools.dart';

class GeocodingHelper {

  Future<Map<String, String>?> getCountryInfo(double lat, double lng) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${Constants.mapsApiKey}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        String? countryName;
        String? countryCode;
        String? cityName;
        String? formattedAddress;

        // Loop all results to find most reliable data
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

          // Pick first result that includes both country and city
          if (countryName != null && countryCode != null && cityName != null) {
            formattedAddress = result['formatted_address'];
            break;
          }
        }

        // Fallback if no result contained both
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
        throw Exception('Failed Geocoding: ${data['status']}');
      }
    } else {
      throw Exception('Failed request: ${response.statusCode}');
    }

    return null;
  }


}
