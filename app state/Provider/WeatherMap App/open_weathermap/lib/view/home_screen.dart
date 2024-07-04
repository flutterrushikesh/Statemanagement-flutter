// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:open_weathermap/model/weather_model.dart';

import 'package:open_weathermap/controller/weather_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  bool errorModelType = false;
  bool inProgress = false;

  String message = 'Search for the location fetch data';

  TextEditingController getLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(75, 96, 128, 1),
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : errorModelType
              ? Center(
                  child: AlertDialog(
                    title: Row(
                      children: [
                        const Icon(
                          Icons.cancel_outlined,
                          size: 35,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            'Please enter valid city name',
                            style: GoogleFonts.poppins(
                              // color: Colors.whi,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      '${Provider.of<WeatherController>(context, listen: false).obj.myError.myMessage}',
                      style: GoogleFonts.poppins(
                        // color: Colors.whi,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          errorModelType = false;
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(75, 96, 128, 1),
                          ),
                        ),
                        child: Text(
                          'Retry',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: getLocationController,
                        cursorColor: Colors.black,
                        cursorWidth: 1.5,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: const Icon(Icons.search),
                          hintText: "Search city eg. Pune",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          contentPadding: const EdgeInsets.all(13),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Image.asset('assets/images/search location.png'),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          setState(() {
            inProgress = true;
          });

          var pref = await SharedPreferences.getInstance();
          await pref.setString('location', getLocationController.text);

          await pref.setBool('isSearchLocation', false);
          Future.delayed(const Duration(seconds: 2), () async {
            await Provider.of<WeatherController>(context, listen: false)
                .getWeatherData(getLocationController.text);
            setState(
              () {
                inProgress = false;
              },
            );
            getLocationController.clear();
            if (Provider.of<WeatherController>(context, listen: false).obj !=
                    null &&
                Provider.of<WeatherController>(context, listen: false)
                        .obj
                        .runtimeType ==
                    WeatherModel) {
              Navigator.of(context).pushNamed('weatherScreen');
              naviagateTo();
            } else {
              setState(() {});
              errorModelType = true;
            }
          });
        },
        backgroundColor: Colors.white,
        elevation: 5,
        label: Text(
          'Check Weather',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void naviagateTo() async {
    log('IN Shared preferance');
  }
}
