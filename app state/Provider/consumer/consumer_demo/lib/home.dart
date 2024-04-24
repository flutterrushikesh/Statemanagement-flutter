import 'dart:developer';

import 'package:consumer_demo/myproviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    log("IN HOMESCREEN BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumer"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 150,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    blurRadius: 10,
                    offset: Offset(3, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Provider.of<Player>(context).pName),
                  const SizedBox(height: 5),
                  Text("${Provider.of<Player>(context).jerNo}"),
                  Consumer(builder: (context, value, child) {
                    log("In Consumer");
                    return Column(
                      children: [
                        const SizedBox(height: 5),
                        Text("${Provider.of<Match>(context).matchNo}"),
                        const SizedBox(height: 5),
                        Text("${Provider.of<Match>(context).runs}"),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Match>(context, listen: false)
                    .changeInfo(201, 3021);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue.shade200),
              ),
              child: const Text(
                "Change Data",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // const NormalClass(),
          ],
        ),
      ),
    );
  }
}

class NormalClass extends StatelessWidget {
  const NormalClass({super.key});
  @override
  Widget build(BuildContext context) {
    log("IN NORMAL BUILD");
    return Text(Provider.of<Player>(context).pName);
  }
}
