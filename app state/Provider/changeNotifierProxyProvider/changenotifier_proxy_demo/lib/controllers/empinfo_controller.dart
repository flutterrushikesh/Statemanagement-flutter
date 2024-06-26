import 'package:flutter/material.dart';

class EmpInfoController with ChangeNotifier {
  String projectName;
  String devType;
  String empName;
  int empId;

  EmpInfoController(
      {required this.projectName,
      required this.devType,
      required this.empId,
      required this.empName});
}
