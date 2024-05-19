import 'package:flutter/material.dart';
import 'package:login_inheritedwidget/controllers/login_controller.dart';
import 'package:login_inheritedwidget/views/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginController(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
