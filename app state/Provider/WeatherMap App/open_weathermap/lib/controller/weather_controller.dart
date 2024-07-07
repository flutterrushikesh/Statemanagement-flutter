import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_weathermap/controller/api_controller.dart';

class WeatherController extends ChangeNotifier {
  dynamic obj; //Stores a API retured object.
  bool inProgress = false; //To circularProgressBar.
  bool isError = false; //To check error.
  bool isInternetConnection = false; //To Check internetConnection.

  //If call this method server can hited.
  Future<void> getWeatherData(String? location) async {
    //hit the server and stores returned value from APi.
    obj = await WeatherApi().getCurrentWeather(location!);
    notifyListeners();
  }

  //calls when toggle circular progressbar satisfy condition .
  void inProgressCheck() {
    inProgress = !inProgress;
    notifyListeners();
  }

  //calls when toggle error box if satisfy condition.
  void isErrorCheck() {
    isError = !isError;
    notifyListeners();
  }

  //calls when toggle internet connection on or off if satisfy condition.
  void isChecknternetConnection() {
    isInternetConnection = !isInternetConnection;
    notifyListeners();
  }
}
