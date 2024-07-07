import 'dart:developer';

import 'package:open_weathermap/model/error_message_model.dart';

class ErrorModel {
  ErrorMessageModel? myError;

//fills the Error variables.
  ErrorModel(Map<String, dynamic> json) {
    myError = json['error'] != null ? ErrorMessageModel(json['error']) : null;
  }
}
