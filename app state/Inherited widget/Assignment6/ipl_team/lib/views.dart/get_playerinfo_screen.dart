import 'package:flutter/material.dart';
import 'package:ipl_team/controllers/players_controller.dart';
import 'package:ipl_team/models/player_model.dart';
import 'package:ipl_team/views.dart/display_playerinfo.dart';

class GetPlayerInfo extends StatefulWidget {
  const GetPlayerInfo({super.key});

  @override
  State createState() => _GetPlayerInfo();
}

class _GetPlayerInfo extends State {
  TextEditingController pNameController = TextEditingController();
  TextEditingController jerNoController = TextEditingController();
  TextEditingController pCountryContoller = TextEditingController();
  TextEditingController pIplTeamController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Player Details"),
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: pNameController,
                decoration: InputDecoration(
                  hintText: "Player name",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter player name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: jerNoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Jersy number",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter jersy number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: pCountryContoller,
                decoration: InputDecoration(
                  hintText: "Country",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter country";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: pIplTeamController,
                decoration: InputDecoration(
                  hintText: "Ipl team",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade900),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter ipl team";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  bool validate = formKey.currentState!.validate();

                  if (validate) {
                    PlayerModel obj = PlayerModel(
                        iplTeam: pIplTeamController.text,
                        jerNo: jerNoController.text,
                        pCountry: pCountryContoller.text,
                        pName: pNameController.text);

                    Players.of(context).addObj(obj);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Details saved succesfully"),
                      ),
                    );

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const DisplayeData();
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter all details"),
                      ),
                    );
                  }
                },
                child: const Text("Save details"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
