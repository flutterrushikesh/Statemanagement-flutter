import 'package:emplouyee_skills/controller/inheritedwidget.dart';
import 'package:emplouyee_skills/model/emp_model.dart';
import 'package:emplouyee_skills/view/view_skill.dart';
import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});
  @override
  State createState() => _SkillsState();
}

class _SkillsState extends State {
  TextEditingController skillController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add your skills",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: skillController,
                decoration: InputDecoration(
                  hintText: "Skill",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 7, 3, 125),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 7, 3, 125),
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Please enter skill";
                  }
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  bool validator = formKey.currentState!.validate();
                  if (validator) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Skill add successfully"),
                      ),
                    );
                    var obj = EmployeeModel(
                      skill: skillController.text.trim(),
                    );
                    EmpData.of(context).addObj(obj);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ShowSkill(),
                      ),
                    );
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(5, 156, 211, 0.765),
                  ),
                ),
                child: const Text(
                  "Show skill",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
