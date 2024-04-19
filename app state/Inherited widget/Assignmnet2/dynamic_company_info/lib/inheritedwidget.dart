import 'package:flutter/material.dart';

class Company extends InheritedWidget {
  String compLoc;
  final String compName;
  final String empCount;
  Company(
      {super.key,
      required super.child,
      required this.compLoc,
      required this.compName,
      required this.empCount});

  @override
  bool updateShouldNotify(Company oldWidget) {
    return compLoc != compLoc || compName != compName || empCount != empCount;
  }

  static Company of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }
}
