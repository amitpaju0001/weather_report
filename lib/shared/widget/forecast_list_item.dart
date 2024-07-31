import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/shared/const/color_const.dart';
import 'package:weather_report/shared/const/string_const.dart';

class ForecastListItem extends StatelessWidget {
  final Map<String, dynamic> day;

  const ForecastListItem({required this.day, super.key});

  @override
  Widget build(BuildContext context) {
    String iconUrl = '${StringConst.http}${day[StringConst.day][StringConst.condition]['icon']}';

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  gradientStartColor.withOpacity(0.5),
                  gradientEndColor.withOpacity(0.2),
                ],
              ),
            ),
            child: ListTile(
              leading: Image.network(iconUrl),
              title: Text(
                '${day[StringConst.date]}\n ${day[StringConst.day][StringConst.avgTemp].round()}${StringConst.celcius}',
                style: GoogleFonts.lato(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                day[StringConst.day][StringConst.condition][StringConst.text],
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              trailing: Text(
                '${StringConst.max} ${day[StringConst.day][StringConst.maxTemp]}${StringConst.celcius}\n${StringConst.min} ${day[StringConst.day][StringConst.minTemp]}${StringConst.celcius}',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
