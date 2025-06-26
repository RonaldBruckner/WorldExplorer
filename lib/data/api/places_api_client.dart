import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../tools/tools.dart';

class PlacesApiClient {
  static String TAG = "PlacesApiClient";

  Future<List<Map<String, dynamic>>?> getNearbyAttractions(
      double lat, double lng, {int radius = 5000}) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
            '?location=$lat,$lng&radius=$radius&type=tourist_attraction&key=${Constants.mapsApiKey}');

    try {
      final response = await http.get(url).timeout(const Duration(seconds: Constants.API_TIMEOUT_IN_S));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          return (data['results'] as List).map((item) {
            return {
              'name': item['name'],
              'address': item['vicinity'],
              'rating': item['rating'],
              'location': item['geometry']['location'],
              'photo': item['photos'] != null && item['photos'].isNotEmpty
                  ? item['photos'][0]['photo_reference']
                  : null,
              'types': item['types'],
            };
          }).toList();
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      Tools.logDebug(TAG, 'Exception: $e');
      Tools.logDebug(TAG, 'StackTrace: $stackTrace');
      return null;
    }
  }
}
