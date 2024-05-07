import 'package:player_example/model/player_info_model.dart';

class PlayerInfoController {
  PlayerInfoModel? playerInfoModelObj;

  void addInfoObj(PlayerInfoModel playerInfoModelObj) {
    this.playerInfoModelObj = playerInfoModelObj;
  }
}
