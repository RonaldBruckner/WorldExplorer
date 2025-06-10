import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/api/geocoding_helper.dart';

final geocodingHelperProvider = Provider<GeocodingHelper>((ref) {
  return GeocodingHelper();
});