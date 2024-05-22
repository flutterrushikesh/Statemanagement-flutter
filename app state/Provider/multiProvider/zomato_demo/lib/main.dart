import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_demo/controllers/costomer1_controller.dart';
import 'package:zomato_demo/controllers/costomer2_controller.dart';
import 'package:zomato_demo/controllers/zomato_controller.dart';
import 'package:zomato_demo/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            return Zomato(orderNo: 145);
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Costomer1(
                foodType: "Pizza", costName: "Rushikesh", totalBill: 540);
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Costomer2(
                foodType: "Burger", costName: "Sangam", totalBill: 130);
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
