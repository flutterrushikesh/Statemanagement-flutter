import 'package:emplouyee_skills/inheritedwidget.dart';
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MySkill(
                          skill: skillController.text,
                          child: Container(
                            child: Text(MySkill.of(context).skill),
                          ),
                        ),
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
                  "Add skill",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyContainer extends StatelessWidget {
//   const MyContainer({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const NewContainer(),
//     );
//   }
// }

// class NewContainer extends StatelessWidget {
//   const NewContainer({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return
//         // Container(
//         //   child:
        
//     // );
//   }
// }
