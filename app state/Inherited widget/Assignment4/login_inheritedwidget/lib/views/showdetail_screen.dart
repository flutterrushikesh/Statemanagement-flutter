import 'package:flutter/material.dart';
import 'package:login_inheritedwidget/controllers/login_controller.dart';
import 'package:login_inheritedwidget/models/login_model.dart';

class ShowDetailScreen extends StatelessWidget {
  const ShowDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    LoginModel obj = LoginController.of(context).loginModelObj!;
    print(obj);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your details"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User name:  ${obj.userName}",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Phone number:  ${obj.password}",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Password:  ${obj.phoneNo}",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(obj.userName),
            // Text(obj.password),
            // Text(obj.phoneNo),
          ],
        ),
      ),
    );
  }
}
