import 'package:flutter/material.dart';
import 'package:product/controllers/product_controller.dart';
import 'package:product/view/get_product.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

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
        debugShowCheckedModeBanner: false,
        home: GetDetails(),
      ),
    );
  }
}
