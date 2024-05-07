import 'package:flutter/material.dart';
import 'package:player_example/model/player_model.dart';

class PlayerController with ChangeNotifier {
  PlayerModel? playerModelObj;

  void addObj(PlayerModel playerModelObj) {
    this.playerModelObj = playerModelObj;
    notifyListeners();
  }
}
