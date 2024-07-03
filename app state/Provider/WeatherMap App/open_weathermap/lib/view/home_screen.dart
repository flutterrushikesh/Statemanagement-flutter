import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:open_weathermap/controller/api_controller.dart';
import 'package:open_weathermap/controller/weather_controller.dart';
import 'package:open_weathermap/model/weather_model.dart';
import 'package:open_weathermap/view/weather_detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  WeatherModel? weatherModelresponse;
  bool inProgress = false;

  String message = 'Search for the location fetch data';

  TextEditingController getLocation = TextEditingController();

  GlobalKey<FormState> validTextfield = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: getLocation,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: "Search by City",
                hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.all(13),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter city name";
                }
              },
            ),
            if (weatherModelresponse == null)
              
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _getWeatherData(getLocation.text);
          setState(() {});
          if (weatherModelresponse != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const WeatherDetailScrenn();
                },
              ),
            );
            Provider.of<WeatherController>(context, listen: false)
                .accessObj(weatherModelresponse!);
          }
        },
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

  void _getWeatherData(String? location) async {
    setState(() {
      inProgress = true;
    });
    try {
      weatherModelresponse = await WeatherApi().getCurrentWeather(location!);
    } catch (e) {
      setState(() {
        message = "Failed to load data";
        weatherModelresponse = null;
      });
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}
