import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_weathermap/controller/api_controller.dart';

class WeatherController extends ChangeNotifier {
  dynamic obj;

  Future<void> getWeatherData(String? location) async {
    obj = await WeatherApi().getCurrentWeather(location!);
    log(obj.toString());
    notifyListeners();
  }
}
