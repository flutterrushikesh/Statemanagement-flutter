import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Student1(studName: "Rushi", rollNo: 52);
        })
      ],
      child: Text(""),
    );
  }
}

class Student1 extends ChangeNotifier {
  String studName;
  int rollNo;

  Student1({required this.studName, required this.rollNo});

  void changeStudData(String studName, int rollNo) {
    this.studName = studName;
    this.rollNo = rollNo;
  }
}
