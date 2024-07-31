import 'package:flutter/material.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/screen/forecast_screen.dart';
import 'package:weather_report/shared/const/color_const.dart';
import 'package:weather_report/shared/const/string_const.dart';

class NextDayForecastButton extends StatelessWidget {
  final WeatherProvider weatherProvider;

  const NextDayForecastButton({
    super.key,
    required this.weatherProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForecastScreen(city: weatherProvider.city),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: gradientStartColor,
        ),
        child: const Text(
          StringConst.nextDayForecast,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
