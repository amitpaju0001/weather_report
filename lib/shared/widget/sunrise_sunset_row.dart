import 'package:flutter/material.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/shared/const/string_const.dart';
import 'package:weather_report/shared/widget/weather_detail_widget.dart';

class SunriseSunsetRow extends StatelessWidget {
  final WeatherProvider weatherProvider;

  const SunriseSunsetRow({
    super.key,
    required this.weatherProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherDetailWidget(
          label: StringConst.sunrise,
          icon: Icons.wb_sunny,
          value: weatherProvider.currentWeather![StringConst.forecast][StringConst.forecastDay][0][StringConst.astro][StringConst.sunriseKey],
        ),
        WeatherDetailWidget(
          label: StringConst.sunset,
          icon: Icons.brightness_3,
          value: weatherProvider.currentWeather![StringConst.forecast][StringConst.forecastDay][0][StringConst.astro][StringConst.sunsetKey],
        ),
      ],
    );
  }
}
