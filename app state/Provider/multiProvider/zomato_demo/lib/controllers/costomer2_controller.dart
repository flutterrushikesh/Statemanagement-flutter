import 'package:flutter/material.dart';

class Costomer2 extends ChangeNotifier {
  String costName;
  int totalBill;
  String foodType;

  Costomer2({
    required this.foodType,
    required this.costName,
    required this.totalBill,
  });

  void changeData(String foodType, int totalBill) {
    this.totalBill = totalBill;
  }
}
