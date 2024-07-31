import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/shared/widget/city_selection_dialog.dart';
import 'package:weather_report/shared/widget/city_selector.dart';
import 'package:weather_report/shared/widget/humidity_wind_row.dart';
import 'package:weather_report/shared/widget/next_day_forecast_button.dart';
import 'package:weather_report/shared/widget/reuse_container_widget.dart';
import 'package:weather_report/shared/widget/sunrise_sunset_row.dart';
import 'package:weather_report/shared/widget/temp_range_display.dart';
import 'package:weather_report/shared/widget/weather_icon_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    await weatherProvider.fetchWeather();
  }

  void _showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const CitySelectionDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.currentWeather == null) {
            if (weatherProvider.errorMessage != null) {
              return Center(
                child: Text(
                  weatherProvider.errorMessage!,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            return const ReuseContainerWidget(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }

          return ReuseContainerWidget(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                CitySelector(weatherProvider: weatherProvider, onTap: _showCitySelectionDialog),
                const SizedBox(height: 30),
                WeatherIconDisplay(weatherProvider: weatherProvider),
                const SizedBox(height: 15),
                TempRangeDisplay(weatherProvider: weatherProvider),
                const SizedBox(height: 45),
                SunriseSunsetRow(weatherProvider: weatherProvider),
                const SizedBox(height: 20),
                HumidityWindRow(weatherProvider: weatherProvider),
                const SizedBox(height: 40),
                NextDayForecastButton(weatherProvider: weatherProvider),
              ],
            ),
          );
        },
      ),
    );
  }
}
