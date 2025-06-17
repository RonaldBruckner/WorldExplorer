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

    //Tools.logDebug('getCountryInfo: $response');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        String? countryName;
        String? countryCode;
        String? cityName;

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

          if (countryName != null && countryCode != null) {
            return {
              'name': countryName,
              'code': countryCode,
              'city': cityName ?? '',
              'address': data['results'][0]['formatted_address'] ?? ''
            };
          }
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
