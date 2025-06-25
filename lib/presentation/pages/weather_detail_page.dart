import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/openweather_forecast_day.dart';
import '../../tools/tools.dart';

class WeatherDetailPage extends StatefulWidget {
  final List<ForecastDay> forecast;
  final String currentCityName;
  final int initialPage;

  const WeatherDetailPage({
    super.key,
    required this.forecast,
    required this.currentCityName,
    this.initialPage = 0,
  });

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {

    final forecast = widget.forecast;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.currentCityName),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.teal,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // Android
          statusBarBrightness: Brightness.light,     // iOS
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/splash.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.white.withOpacity(0.75),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),
                // Page indicator with dates
                SizedBox(
                  height: 36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: forecast.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == _currentPage;
                      final date = forecast[index].hourly.first.time;

                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.teal : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              '${Tools.localizedWeekday(context, date)}, ${date.day} ${Tools.localizedMonthAbbreviation(context, date.month)}',
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),

                /// Wrapping the PageView in GestureDetector
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onHorizontalDragEnd: (details) {
                            final velocity = details.primaryVelocity ?? 0;
                            if (velocity < -100) {
                              if (_currentPage < forecast.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              }
                            } else if (velocity > 100) {
                              if (_currentPage > 0) {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              }
                            }
                          },
                          child: PageView.builder(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(), // disable default
                            itemCount: forecast.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              final day = forecast[index];
                              return ListView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                itemCount: day.hourly.length,
                                itemBuilder: (context, i) {
                                  final hour = day.hourly[i];
                                  return Card(
                                    elevation: 1,
                                    margin: const EdgeInsets.symmetric(vertical: 6),
                                    child: ListTile(
                                      leading: Image.asset(
                                        'assets/weather/100/${hour.iconCode}.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      title: Text(
                                        DateFormat.Hm().format(hour.time),
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(Tools.translateWeatherDescription(context, hour.description)),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('${hour.temp.toStringAsFixed(1)}°'),
                                          Text('💨 ${hour.wind.toStringAsFixed(1)} m/s'),
                                          Text('💧 ${hour.humidity.toStringAsFixed(0)}%'),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () async {
                              final uri = Uri.parse('https://openweathermap.org');
                              await launchUrl(uri, mode: LaunchMode.externalApplication);
                            },
                            child: const Text(
                              'Weather data by OpenWeather',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
