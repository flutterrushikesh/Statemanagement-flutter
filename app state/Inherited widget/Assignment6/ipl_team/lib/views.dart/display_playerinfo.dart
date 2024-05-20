import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ipl_team/controllers/players_controller.dart';
// import 'package:ipl_team/models/player_model.dart';
// import 'package:ipl_team/models/player_model.dart';

class DisplayeData extends StatefulWidget {
  const DisplayeData({super.key});

  @override
  State createState() => _DisplayeDataState();
}

class _DisplayeDataState extends State {
  TextEditingController changeIplTeamController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log("IN DISPLAYDATA BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Player info"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Column(
        children: [
          // const MyContainer(),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Players.of(context).playerModelObj!.pName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  Players.of(context).playerModelObj!.jerNo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  Players.of(context).playerModelObj!.pCountry,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  Players.of(context).playerModelObj!.iplTeam,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              bottomSheet();
            },
            child: const Text("Change IPL team "),
          ),
        ],
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 15,
                right: 15,
                left: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Change IPL Team",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // initialValue: "Rushikesh",
                  initialValue: Players.of(context).playerModelObj!.pName,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  readOnly: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // initialValue: "Rushikesh",
                  initialValue: Players.of(context).playerModelObj!.jerNo,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  readOnly: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // initialValue: "Rushikesh",
                  initialValue: Players.of(context).playerModelObj!.pCountry,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  readOnly: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // initialValue: "Rushikesh",
                  initialValue: Players.of(context).playerModelObj!.iplTeam,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Players.of(context).playerModelObj!.iplTeam =
                          changeIplTeamController.text;
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Change IPL Team"),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }
}

// class MyContainer extends StatefulWidget {
//   const MyContainer({super.key});

//   @override
//   State createState() => _MyContainerState();
// }

// class _MyContainerState extends State {
//   @override
//   Widget build(BuildContext context) {
//     log("IN MYCONTAINER BUILD");
//     return Container(
//       alignment: Alignment.center,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             Players.of(context).playerModelObj!.pName,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             Players.of(context).playerModelObj!.jerNo,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             Players.of(context).playerModelObj!.pCountry,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             Players.of(context).playerModelObj!.iplTeam,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }
