import 'package:flutter/material.dart';
import 'package:static_data/staticdata.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PassData(
      name: "Virat Kohali",
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: MyText(),
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 350),
        Container(
          margin: const EdgeInsets.all(100),
          child: Text(
            PassData.of(context).name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        const Text(
          "[Note this data retrives from inherited \nwidget not hard coded]",
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
