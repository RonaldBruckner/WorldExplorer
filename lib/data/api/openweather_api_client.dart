import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants.dart';
import '../../tools/tools.dart';
import '../models/openweather_forecast_day.dart';

class OpenWeatherApiClient {

  static String TAG = "OpenWeatherApiClient";

  Future<List<ForecastDay>?> get4DayForecast(double? lat, double? lon) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.openWeatherApiKey}',
    );
    try {
    final response = await http.get(url).timeout(const Duration(seconds: Constants.API_TIMEOUT_IN_S));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> list = data['list'];

      // Group forecasts by day (yyyy-MM-dd)
      final Map<String, List<dynamic>> groupedByDay = {};
      for (var item in list) {
        final dtTxt = item['dt_txt'];
        final day = dtTxt.split(' ')[0];
        groupedByDay.putIfAbsent(day, () => []).add(item);
      }

      final today = DateTime.now().toLocal();
      final todayDate = DateTime(today.year, today.month, today.day);

      // Select 4 upcoming days including today
      final selectedDayStrings = groupedByDay.keys
          .where((dayStr) {
        final date = DateTime.parse(dayStr);
        return !date.isBefore(todayDate) &&
            date.isBefore(todayDate.add(const Duration(days: 4)));
      })
          .toList()
        ..sort();

      final List<ForecastDay> forecastDays = [];

      for (var dayStr in selectedDayStrings) {
        final entries = groupedByDay[dayStr]!;

        final city = data['city'];
        final utcOffsetSeconds = city['timezone'];

        // Create ForecastHour list
        final List<ForecastHour> hourly = entries.map((entry) {

          final utcTime = DateTime.parse(entry['dt_txt']);
          final localTime = utcTime.add(Duration(seconds: utcOffsetSeconds));

          return ForecastHour(
            time: localTime,
            temp: (entry['main']['temp'] as num).toDouble(),
            description: entry['weather'][0]['description'],
            iconCode: entry['weather'][0]['icon'],
            wind: (entry['wind']['speed'] as num).toDouble(),
            humidity: (entry['main']['humidity'] as num).toDouble(),
          );
        }).toList();

        // Get min and max temperature of the day
        final temps = hourly.map((h) => h.temp);
        final minTemp = temps.reduce((a, b) => a < b ? a : b);
        final maxTemp = temps.reduce((a, b) => a > b ? a : b);

        forecastDays.add(ForecastDay(
            day: dayStr,
            minTemp: minTemp,
            maxTemp: maxTemp,
            hourly: hourly,
            sunrise: city['sunrise'],
            sunset: city['sunset'],
            utcOffset: city['timezone']
        ));
      }

      for (var day in forecastDays) {
        Tools.logDebug(TAG, 'Forecast for ${day.day}: min ${day.minTemp}°C, max ${day.maxTemp}°C');
        for (var hour in day.hourly) {
          Tools.logDebug(
            TAG,
            '  ${hour.time.toLocal()} | ${hour.temp}°C | ${hour.description} | Wind: ${hour.wind} m/s | Humidity: ${hour.humidity}% | Icon${hour.iconCode}',
          );
        }
      }

      return forecastDays;
    }
    } catch (e, stackTrace) {
      Tools.logDebug(TAG, 'Exception: $e');
      Tools.logDebug(TAG, 'StackTrace: $stackTrace');
      return null;
    }
  }

}