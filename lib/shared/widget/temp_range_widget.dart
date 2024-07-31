import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempRangeWidget extends StatelessWidget {
  final int maxTemp;
  final int minTemp;

  const TempRangeWidget({
    super.key,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Max: $maxTemp°C',
          style: GoogleFonts.lato(
            fontSize: 22,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Min: $minTemp°C',
          style: GoogleFonts.lato(
            fontSize: 22,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
