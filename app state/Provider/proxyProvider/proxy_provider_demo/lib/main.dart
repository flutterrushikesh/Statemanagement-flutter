import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider_demo/controllers/employee_controller.dart';
import 'package:proxy_provider_demo/controllers/login_controller.dart';
import 'package:proxy_provider_demo/view/homeScreen.dart';

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
        Provider(
          create: (context) {
            log("IN LOGIN PROVIDER Create");
            return Login(userName: "Sangam@2003", userPass: "sangam@123");
          },
        ),
        ProxyProvider<Login, Employee>(
          update: (context, login, employee) {
            log("IN UPDATE");
            return Employee(
              empId: 12,
              empName: "Sangam",
              userName: login.userName,
              userPass: login.userPass,
            );
          },
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
