// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:open_weathermap/controller/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:open_weathermap/model/error_model.dart';
import 'package:open_weathermap/model/weather_model.dart';

class WeatherApi {
  //API link.
  final String baseUrl = 'http://api.weatherapi.com/v1/current.json';

  //hit the server.
  Future<dynamic> getCurrentWeather(String location) async {
    //baseUrl, apiKey, locatio.
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";

    //in that response stores the API return data.
    final response = await http.get(Uri.parse(apiUrl));

    //User enterd value is true & Status code is 200 then fills the
    //WeatherModel class.

    //User enterd value is false & Status code is 400 then fills the
    //ErrorModel class.
    if (response.statusCode == 200) {
      return WeatherModel(
        jsonDecode(response.body),
      );
    } else {
      return ErrorModel(
        jsonDecode(response.body),
      );
    }
  }
}
