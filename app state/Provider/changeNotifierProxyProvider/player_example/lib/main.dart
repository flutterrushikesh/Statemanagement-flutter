import 'package:flutter/material.dart';
import 'package:player_example/controllers/player._controller.dart';
import 'package:player_example/controllers/player_info_controller.dart';
import 'package:player_example/views/get_info_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return PlayerController();
          },
        ),
        ProxyProvider(
            update: (context, playerController, playerInfoController) {
          return PlayerInfoController();
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetInfo(),
      ),
    );
  }
}
