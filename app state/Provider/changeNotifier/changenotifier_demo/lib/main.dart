import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return Company(
          pName: "Virat Kohli", jerNo: 18, country: "IND", iplTeam: "RCB");
    });
  }
}

class Company extends ChangeNotifier {
  String pName;
  int jerNo;
  String country;
  String iplTeam;

  Company(
      {required this.pName,
      required this.jerNo,
      required this.country,
      required this.iplTeam});
}
