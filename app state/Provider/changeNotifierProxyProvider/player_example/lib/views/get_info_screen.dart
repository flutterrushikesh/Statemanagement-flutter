import 'package:flutter/material.dart';
import 'package:player_example/controllers/player._controller.dart';
import 'package:player_example/controllers/player_info_controller.dart';
import 'package:player_example/model/player_info_model.dart';
import 'package:player_example/model/player_model.dart';
import 'package:player_example/views/show_data_screen.dart';
import 'package:provider/provider.dart';

class GetInfo extends StatefulWidget {
  const GetInfo({super.key});

  @override
  State<GetInfo> createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  TextEditingController playerNameController = TextEditingController();
  TextEditingController playerCountryController = TextEditingController();
  TextEditingController playerJerNoController = TextEditingController();
  TextEditingController playerIplTeamController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Players Info"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: playerNameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Player Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.blue.shade900),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: playerJerNoController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Player jerNo",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.blue.shade900),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: playerCountryController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Player country",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.blue.shade900),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: playerIplTeamController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Player IPL team",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.blue.shade900),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (playerNameController.text.trim().isNotEmpty &&
                    playerJerNoController.text.trim().isNotEmpty &&
                    playerCountryController.text.trim().isNotEmpty &&
                    playerIplTeamController.text.trim().isNotEmpty) {
                  var playerControllerObj = PlayerModel(
                      jerNo: playerJerNoController.text,
                      pName: playerNameController.text);

                  Provider.of<PlayerController>(context, listen: false)
                      .addObj(playerControllerObj);

                  var playerInfoObj = PlayerInfoModel(
                      jerNo: playerJerNoController.text,
                      pCountry: playerCountryController.text,
                      pIplTeam: playerIplTeamController.text,
                      pName: playerNameController.text);

                  Provider.of<PlayerInfoController>(context, listen: false)
                      .addInfoObj(playerInfoObj);
                  Navigator.of(context).push(MaterialPageRoute(builder: (
                    context,
                  ) {
                    return const ShowData();
                  }));
                }
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
              ),
              child: const Text(
                "Show Data",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
