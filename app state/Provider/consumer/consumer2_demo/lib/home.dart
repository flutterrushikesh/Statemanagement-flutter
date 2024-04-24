import 'package:consumer2_demo/myproviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});
  @override
  State createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State {
  @override
  Widget build(BuildContext context) {
    log("IN MAINSCAFFOLD BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumer2"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    offset: Offset(-4, 6),
                    blurRadius: 18,
                  ),
                ],
              ),
              child: Consumer2<Student, ChangeData>(
                builder: (context, value1, value2, child) {
                  log("IN CONSUMER2");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Provider.of<Student>(context).studName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${Provider.of<Student>(context).prnNo}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        Provider.of<ChangeData>(context).studBranch,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        Provider.of<ChangeData>(context).acadmicyear,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Provider.of<Student>(context, listen: false)
                    .changeStudentData("Sumit", 8923442344);
                Provider.of<ChangeData>(context, listen: false)
                    .changeInfo("E&C", "2024-2025");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue.shade200),
              ),
              child: const Text(
                "Change Info",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
