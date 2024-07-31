import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/provider/weather_provider.dart';

class CitySelector extends StatelessWidget {
  final WeatherProvider weatherProvider;
  final VoidCallback onTap;

  const CitySelector({
    super.key,
    required this.weatherProvider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          weatherProvider.city,
          style: GoogleFonts.lato(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
