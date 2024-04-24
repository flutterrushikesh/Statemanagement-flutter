import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consumer_demo/myproviders.dart';
import 'package:consumer_demo/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    log("IN MYAPP BUILD");
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            return Player(pName: "Virat", jerNo: 18);
          },
        ),
        ChangeNotifierProvider(create: (context) {
          return Match(matchNo: 189, runs: 2522);
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
