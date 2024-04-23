import 'package:emplouyee_skills/inheritedwidget.dart';
import 'package:emplouyee_skills/skills.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});
  @override
  State createState() => _ShowDataState();
}

class _ShowDataState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Display Empdata",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              // height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Emp name: ${EmpData.of(context).empName}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Emp name: ${EmpData.of(context).empId}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Emp name: ${EmpData.of(context).project}",
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Skills(),
                  ),
                );
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(5, 156, 211, 0.765),
                ),
              ),
              child: const Text(
                "Add Skill",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
