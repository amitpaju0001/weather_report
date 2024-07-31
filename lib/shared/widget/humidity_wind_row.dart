import 'package:flutter/material.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/shared/const/string_const.dart';
import 'package:weather_report/shared/widget/weather_detail_widget.dart';

class HumidityWindRow extends StatelessWidget {
  final WeatherProvider weatherProvider;

  const HumidityWindRow({
    super.key,
    required this.weatherProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherDetailWidget(
          label: StringConst.humidityLabel,
          icon: Icons.opacity,
          value: weatherProvider.currentWeather![StringConst.current][StringConst.humidityKey],
        ),
        WeatherDetailWidget(
          label: StringConst.windLabel,
          icon: Icons.wind_power,
          value: weatherProvider.currentWeather![StringConst.current][StringConst.windKey],
        ),
      ],
    );
  }
}
