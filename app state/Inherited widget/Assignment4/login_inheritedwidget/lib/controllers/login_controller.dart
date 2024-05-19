import 'package:flutter/material.dart';
import 'package:login_inheritedwidget/models/login_model.dart';

class LoginController extends InheritedWidget {
  LoginModel? loginModelObj;

  LoginController({
    super.key,
    required super.child,
    this.loginModelObj,
  });

  void addObj(LoginModel loginModelObj) {
    this.loginModelObj = loginModelObj;
  }

  static LoginController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(LoginController oldWidget) {
    return true;
  }
}
