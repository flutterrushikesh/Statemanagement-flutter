import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_demo/controllers/costomer1_controller.dart';
import 'package:zomato_demo/controllers/costomer2_controller.dart';
import 'package:zomato_demo/controllers/zomato_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Same Variable Name, multi P."),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Provider.of<Zomato>(context).orderNo}"),
            const SizedBox(
              height: 10,
            ),
            Text(Provider.of<Costomer1>(context).costName),
            const SizedBox(
              height: 10,
            ),
            Text(Provider.of<Costomer1>(context).foodType),
            const SizedBox(
              height: 10,
            ),
            Text("${Provider.of<Costomer1>(context).totalBill}"),
            const SizedBox(
              height: 10,
            ),
            // Text(Provider.of<Costomer2>(context).costName),
            // const SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
