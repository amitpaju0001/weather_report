import 'package:flutter/material.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/shared/const/string_const.dart';
import 'package:weather_report/shared/widget/weather_icon_widget.dart';

class WeatherIconDisplay extends StatelessWidget {
  final WeatherProvider weatherProvider;

  const WeatherIconDisplay({
    super.key,
    required this.weatherProvider,
  });

  @override
  Widget build(BuildContext context) {
    return WeatherIconWidget(
      iconUrl: weatherProvider.currentWeather![StringConst.current][StringConst.condition][StringConst.icon],
      temperature: weatherProvider.currentWeather![StringConst.current][StringConst.tempC].round(),
      conditionText: weatherProvider.currentWeather![StringConst.current][StringConst.condition][StringConst.text],
    );
  }
}
