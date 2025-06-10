import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationLookup on AppLocalizations {
  /// Fallback-based key lookup, useful for dynamic keys like 'fact_de'
  String lookup(String key) {
    final map = this as dynamic;
    return map.getText(key) ?? key;
  }
}