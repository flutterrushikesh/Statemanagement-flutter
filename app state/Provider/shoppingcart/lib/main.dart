import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/controller/product_controller.dart';
import 'package:shoppingcart/views/myproduct_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProductController();
      },
      child: const MaterialApp(
        home: MyProductScreen(),
      ),
    );
  }
}
