// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weathermap/controller/weather_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State createState() => _SplashScrennState();
}

class _SplashScrennState extends State {
  //calls the initState method. it calls the before the build method.
  @override
  void initState() {
    // call that fuction because excution before the build method calls.
    whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(75, 96, 128, 1),
      body: Provider.of<WeatherController>(context).inProgress
          ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Provider.of<WeatherController>(context).isInternetConnection
              ? AlertDialog(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.wifi_off,
                        color: Colors.red,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "You're offline",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  content: Text(
                    "Please check your internet connection",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        //Create instace of connectivity to check the intenet connection.

                        final List<ConnectivityResult> connectivityResult =
                            await (Connectivity().checkConnectivity());
                        //if internet connection is on.
                        if (connectivityResult
                                .contains(ConnectivityResult.mobile) ||
                            connectivityResult
                                .contains(ConnectivityResult.wifi)) {
                          whereToGo();
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(75, 96, 128, 1),
                        ),
                      ),
                      child: Text(
                        'Reconnect',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              //Else show the splash screen.
              : Center(
                  child: Image.asset(
                    'assets/images/splash icon.png',
                    color: Colors.white,
                  ),
                ),
    );
  }

  void whereToGo() async {
    //Create object of Shared Preferences.
    SharedPreferences pref = await SharedPreferences.getInstance();

    //Retrive data in isSearched. if 1st time entry in app they can be null.
    //and at the time of 2nd time of entry in the app last change are saved.
    bool? isSearched = pref.getBool('isSearchLocation');

//Create instace of Connnectivity to check the ineternet connectivity.
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        if (mounted) {
          Provider.of<WeatherController>(context, listen: false)
              .inProgressCheck();
        }

        //checks the internet connection on or off.
        if (connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.wifi)) {
          Provider.of<WeatherController>(context, listen: false)
              .isChecknternetConnection();

          if (isSearched != null) {
            //if isSearched true it navigates the homeScreen

            if (isSearched) {
              Navigator.of(context).pushReplacementNamed('homeScreen');
            }
            //Else it is false it navigates the Weather details screen.
            else {
              //calls this method when last searched city.
              await Provider.of<WeatherController>(context, listen: false)
                  .getWeatherData(pref.getString('location'));

              //Navigate to weatherDetails screen.
              //named routing.

              Navigator.of(context).pushReplacementNamed('weatherScreen');
            }
          } else {
            //if getbool is null then it navigates the homescree.
            //named routing
            Navigator.of(context).pushReplacementNamed('homeScreen');
          }

          Provider.of<WeatherController>(context, listen: false)
              .inProgressCheck();
        }

        //If internet connection is off.

        else {
          //to handel the circular progress a
          Provider.of<WeatherController>(context, listen: false)
              .inProgressCheck();
          //calls that method to show error.
          Provider.of<WeatherController>(context, listen: false)
              .isChecknternetConnection();
        }
      },
    );
  }
}
