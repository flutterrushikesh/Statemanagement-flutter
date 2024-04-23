import 'package:flutter/material.dart';
import 'package:dynamic_company_info/inheritedwidget.dart';
import 'package:dynamic_company_info/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Company(
      compLoc: "",
      compName: "",
      empCount: "",
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
