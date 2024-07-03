import 'dart:developer';

import 'package:open_weathermap/model/weather_model.dart';

class WeatherController {
  WeatherModel? obj;

  void accessObj(WeatherModel obj) {
    this.obj = obj;
    log("Obj acess sucessfully");
  }
}
