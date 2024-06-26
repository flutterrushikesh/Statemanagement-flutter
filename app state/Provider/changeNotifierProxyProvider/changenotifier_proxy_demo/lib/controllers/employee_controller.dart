import 'package:flutter/material.dart';

class EmployeeController with ChangeNotifier {
  String empName;
  int empId;

  EmployeeController({required this.empId, required this.empName});
}
