import 'package:flutter/material.dart';

class PassData extends InheritedWidget {
  final String name;
  const PassData({super.key, required this.name, required super.child});

  static PassData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(PassData oldWidget) {
    return name != name;
  }
}
