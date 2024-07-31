import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/shared/const/color_const.dart';
import 'package:weather_report/shared/const/string_const.dart';
import 'package:weather_report/shared/widget/reuse_container_widget.dart';

class ForecastScreen extends StatefulWidget {
  final String city;

  const ForecastScreen({required this.city, super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  void initState() {
    super.initState();
    _fetchForecast();
  }

  Future<void> _fetchForecast() async {
    final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    await weatherProvider.fetchForecastDays();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) {
            if (weatherProvider.forecast == null) {
              return const ReuseContainerWidget(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            }

            return ReuseContainerWidget(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
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
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: weatherProvider.forecast!.length,
                      itemBuilder: (context, index) {
                        final day = weatherProvider.forecast![index];
                        String iconUrl =
                            '${StringConst.http}${day[StringConst.day][StringConst.condition]['icon']}';
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
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
