import 'package:flutter/material.dart';

class Student extends ChangeNotifier {
  String studName;
  int prnNo;

  Student({
    required this.studName,
    required this.prnNo,
  });

  void changeStudentData(String studName, int prnNo) {
    this.studName = studName;
    this.prnNo = prnNo;
    notifyListeners();
  }
}

class ChangeData extends ChangeNotifier {
  String studBranch;
  String acadmicyear;

  ChangeData({
    required this.studBranch,
    required this.acadmicyear,
  });

  void changeInfo(String studBranch, String acadmicyear) {
    this.studBranch = studBranch;
    this.acadmicyear = acadmicyear;
    notifyListeners();
  }
}
