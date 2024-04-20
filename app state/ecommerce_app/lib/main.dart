// import 'package:ecommerce_app/statemanagement.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/login.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext cotext) {
    return
        // Provider(
        //   create: (context){
        //     return UserInfo(userName: userName, password: password)
        //   },
        //   child:
        const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      // ),
    );
  }
}
