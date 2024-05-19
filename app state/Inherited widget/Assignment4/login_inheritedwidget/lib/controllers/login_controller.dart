import 'package:flutter/material.dart';
import 'package:login_inheritedwidget/models/login_model.dart';

class LoginController extends InheritedWidget {
  final Login? loginModelObj;

  const LoginController({super.key, required super.child, this.loginModelObj});

  @override
  bool updateShouldNotify(LoginController oldWidget) {
    return true;
  }
}
