import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:open_weathermap/controller/api.dart';
import 'package:open_weathermap/model/weather_model.dart';
import 'package:open_weathermap/view/weather_detail_screen.dart';

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
            TextField(
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
            ),
            if (inProgress)
              const CircularProgressIndicator()
            else
              Expanded(child: SingleChildScrollView(child: _weatherDetail())),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _getWeatherData(getLocation.text);

          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return const WeatherDetailScrenn();
          //     },
          //   ),
          // );
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

  Widget _weatherDetail() {
    if (weatherModelresponse == null) {
      return Text(message);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.location_on,
                size: 50,
              ),
              Text(
                "${weatherModelresponse?.location!.name!}",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  "${weatherModelresponse?.location!.country!}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${weatherModelresponse?.current!.tempC!}°C",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  // color: Colors.white,
                ),
              ),
              Text(
                "${weatherModelresponse?.current!.condition!.text}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  // color: Colors.white,
                  // fontSize: 2,
                ),
              ),
            ],
          ),
          Center(
            child: Image.network(
              'https:${weatherModelresponse!.current!.condition!.icon!}'
                  .replaceAll('64x64', '128x128'),
              scale: 0.7,
            ),
          ),
          Card(
            elevation: 4,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dataAndTitleWidget('Humidity',
                        '${weatherModelresponse?.current!.humidity!}'),
                    dataAndTitleWidget('Wind Speed',
                        '${weatherModelresponse?.current!.windKph!} km/h'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dataAndTitleWidget(
                        'UV', '${weatherModelresponse?.current!.uv!}'),
                    dataAndTitleWidget('Percipitation',
                        '${weatherModelresponse?.current!.precipMm!} mm'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dataAndTitleWidget(
                        'Local Time',
                        '${weatherModelresponse?.location!.localtime!}'
                            .split(' ')
                            .last),
                    dataAndTitleWidget(
                      'Local Date',
                      '${weatherModelresponse?.location!.localtime!}'
                          .split(' ')
                          .first,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    }
  }

  Widget dataAndTitleWidget(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            data,
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
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
