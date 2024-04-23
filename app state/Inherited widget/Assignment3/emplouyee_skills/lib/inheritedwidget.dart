import 'package:flutter/material.dart';

class EmpData extends InheritedWidget {
  final String empName;
  final String project;
  final String empId;
  const EmpData(
      {super.key,
      required this.empName,
      required this.empId,
      required this.project,
      required super.child});

  static EmpData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(EmpData oldWidget) {
    return empName != oldWidget.empName ||
        empId != oldWidget.empId ||
        project != oldWidget.project;
  }
}

class MySkill extends InheritedWidget {
  final String skill;
  const MySkill({super.key, required this.skill, required super.child});

  static MySkill of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(MySkill oldWidget) {
    return skill != oldWidget.skill;
  }
}
