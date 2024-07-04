// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_weathermap/controller/weather_controller.dart';
import 'package:open_weathermap/view/home_screen.dart';
import 'package:open_weathermap/view/weather_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State createState() => _SplashScrennState();
}

class _SplashScrennState extends State {
  @override
  void initState() {
    whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(75, 96, 128, 1),
      body: Center(
        child: Image.asset(
          'assets/images/splash icon.png',
          color: Colors.white,
        ),
      ),
    );
  }

  void whereToGo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic isSearched = pref.getBool('isSearchLocation');

    Timer(const Duration(seconds: 2), () {
      if (isSearched != null) {
        if (isSearched) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const WeatherDetailScrenn();
              },
            ),
          );
        } else {
          Future.delayed(const Duration(seconds: 1), () async {
            await Provider.of<WeatherController>(context, listen: false)
                .getWeatherData(pref.getString('location'));

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const WeatherDetailScrenn();
                },
              ),
            );
          });
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
      }
    });
  }
}
