class ForecastDay {
  final String day;
  final double minTemp;
  final double maxTemp;
  final int? sunrise;
  final int? sunset;
  final int utcOffset;
  final List<ForecastHour> hourly;

  ForecastDay({
    required this.day,
    required this.minTemp,
    required this.maxTemp,
    required this.hourly,
    required this.sunrise,
    required this.sunset,
    required this.utcOffset,
  });
}


class ForecastHour {
  final DateTime time;
  final double temp;
  final String description;
  final String iconCode;
  final double wind;
  final double humidity;

  ForecastHour({
    required this.time,
    required this.temp,
    required this.description,
    required this.iconCode,
    required this.wind,
    required this.humidity,
  });
}