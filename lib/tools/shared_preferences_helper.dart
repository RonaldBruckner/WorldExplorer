// shared_preferences_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static late SharedPreferences _prefs;

  // Call this once during app startup
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveAutoload(bool autoload) async {
    await _prefs.setBool('autoload', autoload);
  }

  static bool getAutoload() {
    return _prefs.getBool('autoload') ?? false; // default to false if not set
  }

  static Future<void> saveUsername(String username) async {
    await _prefs.setString('username', username);
  }

  static Future<String?> getUsername() async {
    return _prefs.getString('username');
  }

  static Future<void> saveTargetCurrency(String currency) async {
    await _prefs.setString('target_currency', currency);
  }

  static Future<String?> getTargetCurrency() async {
    return _prefs.getString('target_currency');
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}