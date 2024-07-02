import 'dart:convert';
import 'dart:developer';

import 'package:open_weathermap/controller/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:open_weathermap/model/weather_model.dart';

class WeatherApi {
  final String baseUrl = 'http://api.weatherapi.com/v1/current.json';

  Future<WeatherModel?> getCurrentWeather(String location) async {
    try {
      String apiUrl = "$baseUrl?key=$apiKey&q=$location";

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        log('${response.statusCode}');
        log(response.body);
        return WeatherModel(jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
