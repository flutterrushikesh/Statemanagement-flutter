import "package:flutter/material.dart";
import 'package:hotel_example/orders.dart';

class EphemeralDemo extends StatefulWidget {
  const EphemeralDemo({super.key});
  @override
  State createState() => _EphemeralDemoState();
}

class _EphemeralDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Order(foodName: "Pizza"),
          SizedBox(height: 20),
          Order(foodName: "Burger"),
          SizedBox(height: 20),
          Order(foodName: "Snacks"),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
