import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your wishlist"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Container();
      }),
    );
  }
}
