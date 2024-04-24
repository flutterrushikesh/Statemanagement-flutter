import 'package:consumer2_demo/home.dart';
import 'package:consumer2_demo/myproviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    log("IN MYAPP BUILD");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Student(studName: "Sangam", prnNo: 238294922);
        }),
        ChangeNotifierProvider(create: (context) {
          return ChangeData(
            studBranch: "CS",
            acadmicyear: "2023 - 2024",
          );
        }),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScaffold(),
      ),
    );
  }
}
