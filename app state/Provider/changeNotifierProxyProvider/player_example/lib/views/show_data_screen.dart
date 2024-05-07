import 'package:flutter/material.dart';
import 'package:player_example/controllers/player._controller.dart';
import 'package:player_example/controllers/player_info_controller.dart';
import 'package:provider/provider.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Player Info"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      Provider.of<PlayerInfoController>(context)
                          .playerInfoModelObj!
                          .pName,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Provider.of<PlayerInfoController>(context)
                          .playerInfoModelObj!
                          .jerNo,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Provider.of<PlayerInfoController>(context)
                          .playerInfoModelObj!
                          .pCountry,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Provider.of<PlayerInfoController>(context)
                          .playerInfoModelObj!
                          .pIplTeam,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // myBottomSheet();
                  Provider.of<PlayerInfoController>(context, listen: false)
                      .playerInfoModelObj
                      ?.pIplTeam = "Mi";
                },
                child: const Text("Change IPL team"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void myBottomSheet() {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: (context),
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //             top: 20,
  //             left: 20,
  //             right: 20,
  //             bottom: MediaQuery.of(context).viewInsets.bottom),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const Text("Change your team"),
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             TextFormField(
  //               // controller: playerNameController,
  //               initialValue: Provider.of<PlayerInfoController>(context)
  //                   .playerInfoModelObj!
  //                   .pName,
  //               cursorColor: Colors.black,
  //               decoration: InputDecoration(
  //                 hintText: "Player Name",
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: BorderSide(color: Colors.blue.shade900),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: const BorderSide(
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             TextFormField(
  //               // controller: playerJerNoController,
  //               initialValue: Provider.of<PlayerInfoController>(context)
  //                   .playerInfoModelObj!
  //                   .jerNo,
  //               cursorColor: Colors.black,
  //               decoration: InputDecoration(
  //                 hintText: "Player jerNo",
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: BorderSide(color: Colors.blue.shade900),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: const BorderSide(
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             TextFormField(
  //               initialValue: Provider.of<PlayerInfoController>(context)
  //                   .playerInfoModelObj!
  //                   .pCountry,
  //               cursorColor: Colors.black,
  //               decoration: InputDecoration(
  //                 hintText: "Player country",
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: BorderSide(color: Colors.blue.shade900),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: const BorderSide(
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             TextFormField(
  //               cursorColor: Colors.black,
  //               initialValue: Provider.of<PlayerInfoController>(context)
  //                   .playerInfoModelObj!
  //                   .pIplTeam,
  //               decoration: InputDecoration(
  //                 hintText: "Player IPL team",
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: BorderSide(color: Colors.blue.shade900),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: const BorderSide(
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 Provider.of<PlayerInfoController>(context)
  //                         .playerInfoModelObj!
  //                         .pIplTeam =
  //                     Provider.of<PlayerInfoController>(context)
  //                         .playerInfoModelObj!
  //                         .pIplTeam;
  //                 Navigator.pop(context);
  //               },
  //               child: const Text("submit"),
  //             ),
  //             const SizedBox(
  //               height: 20,
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
