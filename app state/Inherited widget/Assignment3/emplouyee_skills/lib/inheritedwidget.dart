import 'package:flutter/material.dart';

class Employee {
  String empName;
  String project;
  String empId;
  List<String> skillsList = [];
  Employee({required this.empName, required this.empId, required this.project});
}



class EmpData extends InheritedWidget {
  final Employee employeeObj;
  final Function addSkills;
  const EmpData(
      {super.key,
      required this.employeeObj,
      required this.addSkills,
      required super.child});

  static EmpData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(EmpData oldWidget) {
    return true;
    // return empName != oldWidget.empName ||
    //     empId != oldWidget.empId ||
    //     project != oldWidget.project;
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

void ADDsKILL(String skill) {}
