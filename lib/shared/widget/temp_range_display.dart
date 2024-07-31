import 'package:flutter/material.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/shared/const/string_const.dart';
import 'package:weather_report/shared/widget/temp_range_widget.dart';


class TempRangeDisplay extends StatelessWidget {
  final WeatherProvider weatherProvider;

  const TempRangeDisplay({
    super.key,
    required this.weatherProvider,
  });

  @override
  Widget build(BuildContext context) {
    return TempRangeWidget(
      maxTemp: weatherProvider.currentWeather![StringConst.forecast][StringConst.forecastDay][0][StringConst.day][StringConst.maxTemp].round(),
      minTemp: weatherProvider.currentWeather![StringConst.forecast][StringConst.forecastDay][0][StringConst.day][StringConst.minTemp].round(),
    );
  }
}
