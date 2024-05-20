import 'package:flutter/material.dart';
import 'package:ipl_team/controllers/players_controller.dart';
import 'package:ipl_team/views.dart/get_playerinfo_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Players(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetPlayerInfo(),
      ),
    );
  }
}
