import 'package:flutter/material.dart';
import 'package:weather_report/shared/const/color_const.dart';

class ReuseContainerWidget extends StatelessWidget {
  final Widget child;

  const ReuseContainerWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            gradientStartColor,
            linearColor,
            linearColor,
            linearColor
          ],
        ),
      ),
      child: child,
    );
  }
}
