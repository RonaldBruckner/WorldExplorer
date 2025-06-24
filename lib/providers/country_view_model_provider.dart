import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

import '../presentation/viewmodels/country_view_model.dart';
import 'country_provider.dart';
import 'geocoding_helper_provider.dart';

final countryViewModelProvider = ChangeNotifierProvider.family<CountryViewModel, String>((ref, languageCode) {
  final repository = ref.read(countryRepositoryProvider);
  final geo = ref.read(geocodingHelperProvider);
  return CountryViewModel(repository, geo, languageCode)..initLifecycle();
});