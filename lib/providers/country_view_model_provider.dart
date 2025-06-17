import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/viewmodels/country_view_model.dart';
import 'country_provider.dart';
import 'geocoding_helper_provider.dart';

final countryViewModelProvider = ChangeNotifierProvider<CountryViewModel>((ref) {
  final repository = ref.read(countryRepositoryProvider);
  final geo = ref.watch(geocodingHelperProvider);

  final viewModel = CountryViewModel(repository,geo);
  viewModel.initLifecycle();

  return viewModel;
});