import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Employee {
  String empName;
  int empId;

  Employee({required this.empName, required this.empId});
}

class Projects extends ChangeNotifier {
  String projectName;
  String devType;

  Projects({required this.projectName, required this.devType});

  void changeProject(String projectName, String devType) {
    this.projectName = projectName;
    this.devType = devType;
  }
}
