import 'package:changenotifier_proxy_demo/controllers/empinfo_controller.dart';
import 'package:changenotifier_proxy_demo/controllers/employee_controller.dart';
import 'package:changenotifier_proxy_demo/view/screen1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return EmployeeController(empName: "Pruthvi", empId: 19);
          },
        ),
        ChangeNotifierProxyProvider(
          create: (context) {
            return EmpInfoController(
                empId: Provider.of(context).empId,
                empName: Provider.of(context).empName,
                devType: "frontend",
                projectName: "Expense manager");
          },
          update: (context, employeeController, previous) {
            return EmpInfoController(
                empId: Provider.of(context).empId,
                empName: Provider.of(context).empName,
                devType: "frontend",
                projectName: "Expense manager");
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen1(),
      ),
    );
  }
}
