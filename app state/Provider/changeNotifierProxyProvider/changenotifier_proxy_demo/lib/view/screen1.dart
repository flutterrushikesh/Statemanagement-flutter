import 'package:changenotifier_proxy_demo/controllers/empinfo_controller.dart';
import 'package:changenotifier_proxy_demo/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change notifierProxy demo"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                Provider.of<EmpInfoController>(context, listen: false).empName),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
