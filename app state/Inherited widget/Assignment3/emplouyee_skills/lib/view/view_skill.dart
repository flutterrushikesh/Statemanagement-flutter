import 'package:emplouyee_skills/controller/inheritedwidget.dart';
import 'package:flutter/material.dart';

class ShowSkill extends StatelessWidget {
  const ShowSkill({super.key});
  @override
  Widget build(BuildContext context) {
    var empObj = EmpData.of(context).empModelObj;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your skill"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: Text(
          empObj!.skill!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
