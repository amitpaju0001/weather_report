import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/provider/weather_provider.dart';
import 'package:weather_report/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return WeatherProvider();
        },)
      ],
      child: MaterialApp(

        title: 'Weather Report ',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}



