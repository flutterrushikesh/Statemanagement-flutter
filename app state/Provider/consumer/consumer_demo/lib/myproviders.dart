import 'package:flutter/material.dart';

class Player {
  String pName;
  int jerNo;

  Player({required this.pName, required this.jerNo});
}

class Match extends ChangeNotifier {
  int matchNo;
  int runs;

  Match({required this.matchNo, required this.runs});

  void changeInfo(int matchNo, int runs) {
    this.matchNo = matchNo;
    this.runs = runs;
    notifyListeners();
  }
}
