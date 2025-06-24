import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/openweather_forecast_day.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../tools/tools.dart';
import '../pages/weather_detail_page.dart';

class WeatherForecastOverview extends StatefulWidget {
  final List<ForecastDay>? forecast;
  final String currentCityName;


  const WeatherForecastOverview({
    super.key,
    required this.forecast,
    required this.currentCityName,
  });

  @override
  State<WeatherForecastOverview> createState() => _WeatherForecastOverviewState();
}

class _WeatherForecastOverviewState extends State<WeatherForecastOverview> {
  List<ForecastDay>? _forecast;
  String? _formattedSunrise;
  String? _formattedSunset;
  List<bool> _iconVisible = [false, false, false, false];
  String? _error;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _forecast = widget.forecast;
    _showForecast();
  }

  @override
  void didUpdateWidget(covariant WeatherForecastOverview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.forecast != widget.forecast) {
      _forecast = widget.forecast;
      _formattedSunrise = null;
      _formattedSunset = null;
      _error = null;
      _iconVisible = [false, false, false, false];
      _showForecast();
    }
  }

  Future<void> _showForecast() async {
    try {

      final sunrise = _forecast!.first.sunrise;
      final sunset = _forecast!.first.sunset;

      if (sunrise != null && sunset != null) {
        final sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
        final sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);

        final formattedSunrise = '${sunriseTime.hour.toString().padLeft(2, '0')}:${sunriseTime.minute.toString().padLeft(2, '0')}';
        final formattedSunset = '${sunsetTime.hour.toString().padLeft(2, '0')}:${sunsetTime.minute.toString().padLeft(2, '0')}';

        setState(() {
          _formattedSunrise = formattedSunrise;
          _formattedSunset = formattedSunset;
        });
      } else {
        setState(() {
          _error = AppLocalizations.of(context)!.failed_to_load_forecast;
        });
      }

      for (int i = 0; i < 4; i++) {
        Future.delayed(Duration(milliseconds: 300 * i), () {
          if (mounted) {
            setState(() {
              _iconVisible[i] = true;
            });
          }
        });
      }

    } catch (e) {
      setState(() {
        _error = AppLocalizations.of(context)!.failed_to_load_forecast;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    if (_forecast == null) {
      return const SizedBox(
        height: 330,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Colors.grey),
          ),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (_error != null) return Text(_error!, style: const TextStyle(color: Colors.red));

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 330),
      child: Material(
        color: Colors.transparent, // or Colors.white if needed
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),

            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.currentCityName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.chevron_right, color: Colors.teal, size: 20), // visual indicator
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: _forecast!.asMap().entries.map((entry) {
                      final i = entry.key;
                      final day = entry.value;

                      return Expanded(
                          child: InkWell(
                          onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 300),
                            pageBuilder: (_, animation, __) => FadeTransition(
                              opacity: animation,
                              child: WeatherDetailPage(
                                forecast: _forecast!,
                                currentCityName: widget.currentCityName,
                                initialPage: i, // <-- pass selected day
                              ),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                              '${Tools.localizedWeekday(context, day.hourly.first.time)}, ${day.hourly.first.time.day} ${Tools.localizedMonthAbbreviation(context, day.hourly.first.time.month)}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                            const SizedBox(height: 2),

                            Text(
                              i == 0 ? AppLocalizations.of(context)!.now : '12:00',
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),

                            const SizedBox(height: 4),

                            Builder(builder: (_) {
                              ForecastHour displayHour;

                              if (i == 0) {
                                final now = DateTime.now();
                                displayHour = day.hourly.reduce((a, b) =>
                                (a.time.difference(now)).abs() < (b.time.difference(now)).abs() ? a : b);
                              } else {

                                displayHour = day.hourly.firstWhere(
                                      (h) => h.time.hour == 12,
                                  orElse: () => day.hourly[day.hourly.length ~/ 2],
                                );
                              }

                              return Column(
                                children: [
                                  SizedBox(
                                    height: 32, // adjust this based on font size (approx. 16 * 2)
                                    child: Text(
                                      Tools.translateWeatherDescription(context, displayHour.description),
                                      style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  AnimatedOpacity(
                                    opacity: _iconVisible[i] ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 500),
                                    child: Image.asset(
                                      'assets/weather/200/${displayHour.iconCode}.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                          text: '${day.minTemp.toStringAsFixed(1)}°',
                                          style: const TextStyle(color: Colors.grey),
                                        ),
                                        const TextSpan(text: ' '),
                                        TextSpan(
                                          text: '${day.maxTemp.toStringAsFixed(1)}°',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text('💨 ${displayHour.wind.toStringAsFixed(1)} m/s', style: const TextStyle(fontSize: 12)),
                                  Text('💧 ${displayHour.humidity.toStringAsFixed(0)}%', style: const TextStyle(fontSize: 12)),
                                ],
                              );
                            }),
                          ],
                        ),
                          ),
                      ),
                      );

                    }).toList(),
                  ),

                  const SizedBox(height: 6),

                  if (_formattedSunrise != null && _formattedSunset != null)
                    Center(
                      child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${AppLocalizations.of(context)!.sunrise}: $_formattedSunrise     ${AppLocalizations.of(context)!.sunset}: $_formattedSunset',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    ),
                  const SizedBox(height: 12),

// Attribution
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () async {
                        final uri = Uri.parse('https://openweathermap.org');
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: const Text(
                        'Weather data by OpenWeather',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
