import 'package:open_weathermap/model/condition_model.dart';

class CurrentModel {
  double? tempC;
  int? isDay;
  ConditionModel? condition;
  double? windKph;
  double? precipMm;
  int? humidity;
  double? uv;

//fills the CurrentModel class variables.
  CurrentModel(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition =
        json['condition'] != null ? ConditionModel(json['condition']) : null;
    windKph = json['wind_kph'];
    precipMm = json['precip_mm'];
    humidity = json['humidity'];
    uv = json['uv'];
  }
}
