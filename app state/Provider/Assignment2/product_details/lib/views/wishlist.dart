import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});
  @override
  State createState() => _WishListState();
}

class _WishListState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your wishlist",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: ListView.builder(itemBuilder: (BuildContext cotext, int index) {
        return Container();
      }),
    );
  }
}
