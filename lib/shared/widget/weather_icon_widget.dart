import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/shared/const/string_const.dart';
class WeatherIconWidget extends StatelessWidget {
  final String iconUrl;
  final int temperature;
  final String conditionText;

  const WeatherIconWidget({
    super.key,
    required this.iconUrl,
    required this.temperature,
    required this.conditionText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network(
            '${StringConst.http}$iconUrl',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Text(
            '$temperature${StringConst.celcius}',
            style: GoogleFonts.lato(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            conditionText,
            style: GoogleFonts.lato(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
