import 'dart:developer';

import 'package:open_weathermap/model/current_model.dart';
import 'package:open_weathermap/model/location_model.dart';

class WeatherModel {
  LocationModel? location;
  CurrentModel? current;

//fills the weatherModel variables.
  WeatherModel(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      location = LocationModel(json['location']);
      current = CurrentModel(json['current']);
    }
  }
}
