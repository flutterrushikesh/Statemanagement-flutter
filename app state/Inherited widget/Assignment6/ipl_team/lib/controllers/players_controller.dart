import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ipl_team/models/player_model.dart';

class Players extends InheritedWidget {
  PlayerModel? playerModelObj;
  Players({super.key, required super.child, this.playerModelObj});

  void addObj(PlayerModel playerModelObj) {
    this.playerModelObj = playerModelObj;
  }

  static Players of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(Players oldWidget) {
    log("IN NOTIFY LISTNER");
    return playerModelObj != oldWidget.playerModelObj;
  }
}
