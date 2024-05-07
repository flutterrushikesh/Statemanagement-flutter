import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider_demo/controllers/employee_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() {
    log("IN HOME SCREEN CREATE");
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    log("IN HOMESCREEN BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proxy provider demo"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<Employee>(context).userName),
            const SizedBox(
              height: 20,
            ),
            Text(Provider.of<Employee>(context).userPass),
            const SizedBox(
              height: 20,
            ),
            Text(Provider.of<Employee>(context).empName),
            const SizedBox(
              height: 20,
            ),
            Text("${Provider.of<Employee>(context).empId}"),
          ],
        ),
      ),
    );
  }
}
