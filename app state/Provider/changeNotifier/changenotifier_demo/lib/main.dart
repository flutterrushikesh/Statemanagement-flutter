import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    log("In MyNotifier build");
    return ChangeNotifierProvider(
      create: (context) {
        return Player(
            pName: "Virat Kohli", jerNo: 18, country: "IND", iplTeam: "RCB");
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyNotifier(),
      ),
    );
  }
}

class MyNotifier extends StatefulWidget {
  const MyNotifier({super.key});
  @override
  State createState() => _MyNotifierState();
}

class _MyNotifierState extends State {
  @override
  Widget build(BuildContext context) {
    log("In MyNotifier build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Notifier"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<Player>(context).pName),
            const SizedBox(height: 5),
            Text("${Provider.of<Player>(context).jerNo}"),
            const SizedBox(height: 5),
            Text(Provider.of<Player>(context).iplTeam),
            const SizedBox(height: 5),
            Text(Provider.of<Player>(context).country),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // setState(() {});
                Provider.of<Player>(context, listen: false).chanageTeam("CSK");
              },
              child: const Text("Change Team"),
            )
          ],
        ),
      ),
    );
  }
}

class Player extends ChangeNotifier {
  String pName;
  int jerNo;
  String country;
  String iplTeam;

  Player(
      {required this.pName,
      required this.jerNo,
      required this.country,
      required this.iplTeam});

  void chanageTeam(String iplTeam) {
    this.iplTeam = iplTeam;
    notifyListeners();
  }
}
