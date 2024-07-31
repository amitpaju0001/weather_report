
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/shared/const/string_const.dart';

class ForecastHeader extends StatelessWidget {
  const ForecastHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            StringConst.forecastDays,
            style: GoogleFonts.lato(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
