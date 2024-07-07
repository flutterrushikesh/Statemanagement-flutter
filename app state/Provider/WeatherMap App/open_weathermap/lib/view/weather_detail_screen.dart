// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:open_weathermap/controller/weather_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherDetailScrenn extends StatefulWidget {
  const WeatherDetailScrenn({super.key});

  @override
  State createState() => _WeatherDetailScrennState();
}

class _WeatherDetailScrennState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            //Create the instance of shared prefrences to save last state in locally
            SharedPreferences pref = await SharedPreferences.getInstance();
            //setBool(true) to stores the last state.
            await pref.setBool('isSearchLocation', true);

            //named routing
            Navigator.of(context).pushReplacementNamed('homeScreen');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "${Provider.of<WeatherController>(context).obj?.location!.name}",
          style: GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Provider.of<WeatherController>(context, listen: false)
                  .getWeatherData(
                '${Provider.of<WeatherController>(context, listen: false).obj!.location!.name}',
              );
            },
            icon: const Icon(
              Icons.refresh,
              size: 28,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromRGBO(39, 80, 69, 1),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${Provider.of<WeatherController>(context).obj?.location!.localtime!}'
                  .split(' ')
                  .first,
              style: GoogleFonts.poppins(
                // fontSize: ,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 196, 195, 195),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${Provider.of<WeatherController>(context).obj?.location!.localtime!}'
                  .split(' ')
                  .last,
              style: GoogleFonts.poppins(
                // fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 196, 195, 195),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "${Provider.of<WeatherController>(context).obj?.current!.tempC!}°",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        'https:${Provider.of<WeatherController>(context).obj!.current!.condition!.icon!}'
                            .replaceAll('64x64', '128x128'),
                        scale: 0.7,
                      ),
                      Text(
                        "${Provider.of<WeatherController>(context).obj?.current!.condition!.text}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Card(
              elevation: 4,
              shadowColor: Colors.grey,
              color: const Color.fromARGB(255, 203, 203, 203),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dataAndTitleWidget('Humidity',
                          '${Provider.of<WeatherController>(context).obj?.current!.humidity!}'),
                      dataAndTitleWidget('Wind Speed',
                          '${Provider.of<WeatherController>(context).obj?.current!.windKph!} km/h'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dataAndTitleWidget('UV',
                          '${Provider.of<WeatherController>(context).obj?.current!.uv!}'),
                      dataAndTitleWidget('Percipitation',
                          '${Provider.of<WeatherController>(context).obj?.current!.precipMm!} mm'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//Repeated Widget created here.
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
}
