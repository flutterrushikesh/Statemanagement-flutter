import 'package:emplouyee_skills/model/emp_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmpData extends InheritedWidget {
  EmployeeModel? empModelObj;
  EmpData({super.key, required super.child});

  void addObj(EmployeeModel empModelObj) {
    this.empModelObj = empModelObj;
  }

  static EmpData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(EmpData oldWidget) {
    return true;
  }
}
