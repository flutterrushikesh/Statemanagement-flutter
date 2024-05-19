import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:employee/controllers/company_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  String compName = "Google";
  int empCount = 250;
  @override
  Widget build(BuildContext context) {
    log("IN MYAPP BUILD");
    return Company(
      empCount: empCount,
      compName: compName,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter internals"),
            backgroundColor: Colors.blue.shade200,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CompanyData(),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    compName = "NVIDIA";
                    empCount++;
                  });
                },
                child: const Text("Change Data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyData extends StatelessWidget {
  const CompanyData({super.key});

  @override
  Widget build(BuildContext context) {
    log("IN COMPANYDATA BUILD");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Company.of(context).compName),
        const SizedBox(
          width: 20,
        ),
        Text("${Company.of(context).empCount}"),
      ],
    );
  }
}
