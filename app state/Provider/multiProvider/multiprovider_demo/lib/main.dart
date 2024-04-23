import 'package:flutter/material.dart';
import 'package:multiprovider_demo/myproviders.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) {
          return Employee(empName: "Sangam", empId: 20);
        }),
        ChangeNotifierProvider(create: (context) {
          return Projects(
              projectName: "Expense Manager", devType: "Mobile dev");
        }),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
