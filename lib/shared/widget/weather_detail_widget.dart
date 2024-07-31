import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDetailWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final dynamic value;

  const WeatherDetailWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  const Color(0xff1a2344).withOpacity(0.5),
                  const Color(0xff1a2344).withOpacity(0.2),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  label,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  value is String ? value : value.toString(),
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




