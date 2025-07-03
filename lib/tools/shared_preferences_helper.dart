// shared_preferences_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static late SharedPreferences _prefs;

  // Call this once during app startup
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static Future<void> saveTargetCurrency(String currency) async {
    await _prefs.setString('target_currency', currency);
  }

  static Future<String?> getTargetCurrency() async {
    return _prefs.getString('target_currency');
  }

  static Future<void> saveSelectedLocation(double latitude, double longitude) async {
    await _prefs.setDouble('latitude', latitude);
    await _prefs.setDouble('longitude', longitude);
  }

  static Future<Map<String, double>?> getSelectedLocation() async {
    final latitude = _prefs.getDouble('latitude');
    final longitude = _prefs.getDouble('longitude');
    if (latitude != null && longitude != null) {
      return {'latitude': latitude, 'longitude': longitude};
    }
    return null;
  }
  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}