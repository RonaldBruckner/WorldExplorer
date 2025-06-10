import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  // API and icon URLs for OpenWeatherMap
  static const String apiUrl = "https://api.openweathermap.org/";
  static const String iconUrl = "https://openweathermap.org/img/w/<ICON_ID>.png";

  static String get openWeatherApiKey => dotenv.env['OPENWEATHER_API_KEY'] ?? '';
  static String get timeZoneApiKey => dotenv.env['TIMEZONE_API_KEY'] ?? '';
  static String get mapsApiKey => dotenv.env['MAPS_API_KEY'] ?? '';


  static const List<Map<String, dynamic>> supportedCountries = [
    {'nameKey': 'country_ar', 'code': 'AR', 'lat': -34.6037, 'lng': -58.3816},
    {'nameKey': 'country_au', 'code': 'AU', 'lat': -35.2809, 'lng': 149.13},
    {'nameKey': 'country_at', 'code': 'AT', 'lat': 48.2082, 'lng': 16.3738},
    {'nameKey': 'country_be', 'code': 'BE', 'lat': 50.8503, 'lng': 4.3517},
    {'nameKey': 'country_br', 'code': 'BR', 'lat': -15.7939, 'lng': -47.8828},
    {'nameKey': 'country_ca', 'code': 'CA', 'lat': 45.4215, 'lng': -75.6972},
    {'nameKey': 'country_cn', 'code': 'CN', 'lat': 39.9042, 'lng': 116.4074},
    {'nameKey': 'country_dk', 'code': 'DK', 'lat': 55.6761, 'lng': 12.5683},
    {'nameKey': 'country_fi', 'code': 'FI', 'lat': 60.1695, 'lng': 24.9354},
    {'nameKey': 'country_fr', 'code': 'FR', 'lat': 48.8566, 'lng': 2.3522},
    {'nameKey': 'country_de', 'code': 'DE', 'lat': 52.52, 'lng': 13.405},
    {'nameKey': 'country_gr', 'code': 'GR', 'lat': 37.9838, 'lng': 23.7275},
    {'nameKey': 'country_in', 'code': 'IN', 'lat': 28.6139, 'lng': 77.209},
    {'nameKey': 'country_ie', 'code': 'IE', 'lat': 53.3498, 'lng': -6.2603},
    {'nameKey': 'country_it', 'code': 'IT', 'lat': 41.9028, 'lng': 12.4964},
    {'nameKey': 'country_jp', 'code': 'JP', 'lat': 35.652832, 'lng': 139.839478},
    {'nameKey': 'country_mx', 'code': 'MX', 'lat': 19.4326, 'lng': -99.1332},
    {'nameKey': 'country_nl', 'code': 'NL', 'lat': 52.3676, 'lng': 4.9041},
    {'nameKey': 'country_nz', 'code': 'NZ', 'lat': -41.2865, 'lng': 174.7762},
    {'nameKey': 'country_no', 'code': 'NO', 'lat': 59.9139, 'lng': 10.7522},
    {'nameKey': 'country_pl', 'code': 'PL', 'lat': 52.2297, 'lng': 21.0122},
    {'nameKey': 'country_ru', 'code': 'RU', 'lat': 55.7558, 'lng': 37.6173},
    {'nameKey': 'country_za', 'code': 'ZA', 'lat': -25.7479, 'lng': 28.2293},
    {'nameKey': 'country_kr', 'code': 'KR', 'lat': 37.5665, 'lng': 126.978},
    {'nameKey': 'country_es', 'code': 'ES', 'lat': 40.4168, 'lng': -3.7038},
    {'nameKey': 'country_se', 'code': 'SE', 'lat': 59.3293, 'lng': 18.0686},
    {'nameKey': 'country_ch', 'code': 'CH', 'lat': 46.9481, 'lng': 7.4474},
    {'nameKey': 'country_tr', 'code': 'TR', 'lat': 39.9334, 'lng': 32.8597},
    {'nameKey': 'country_gb', 'code': 'GB', 'lat': 51.5074, 'lng': -0.1278},
    {'nameKey': 'country_us', 'code': 'US', 'lat': 38.9072, 'lng': -77.0369},
  ];
}
