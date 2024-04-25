import 'package:emplouyee_skills/controller/inheritedwidget.dart';
import 'package:emplouyee_skills/view/skills.dart';
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
              child:
                  const Padding(padding: EdgeInsets.all(10), child: MyColumn()),
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
            ),
          ],
        ),
      ),
    );
  }
}

class MyColumn extends StatefulWidget {
  const MyColumn({super.key});
  @override
  State createState() => _MyColumnState();
}

class _MyColumnState extends State {
  @override
  Widget build(BuildContext context) {
    var empObj = EmpData.of(context).empModelObj;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Emp name: ${empObj!.empName}",
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(height: 5),
        Text(
          "Emp Id: ${empObj.empId}",
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(height: 5),
        Text(
          "Emp project: ${empObj.project}",
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
