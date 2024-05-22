import 'package:flutter/material.dart';

class Costomer1 extends ChangeNotifier {
  String costName;
  int totalBill;
  String foodType;

  Costomer1({
    required this.foodType,
    required this.costName,
    required this.totalBill,
  });

  void changeData(String foodType, int totalBill) {
    this.totalBill = totalBill;
  }
}
