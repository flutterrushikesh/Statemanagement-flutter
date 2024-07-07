import 'package:flutter/material.dart';
import 'package:open_weathermap/controller/weather_controller.dart';
import 'package:open_weathermap/view/home_screen.dart';
import 'package:open_weathermap/view/splash_screen.dart';
import 'package:open_weathermap/view/weather_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  //entry point of application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherController();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          'homeScreen': (context) => const HomeScreen(),
          'weatherScreen': (context) => const WeatherDetailScrenn()
        },
      ),
    );
  }
}
