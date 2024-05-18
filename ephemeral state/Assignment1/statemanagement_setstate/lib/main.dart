import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySetStateDemo(),
    );
  }
}

class MySetStateDemo extends StatefulWidget {
  const MySetStateDemo({super.key});
  @override
  State createState() => _MySetStateDemoState();
}

class _MySetStateDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SetState Statemanagement",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Course(courseName: "Java"),
          Course(courseName: "Flutter"),
        ],
      ),
    );
  }
}

class Course extends StatefulWidget {
  final courseName;
  const Course({super.key, required this.courseName});
  @override
  State createState() => _CourseState();
}

class _CourseState extends State<Course> {
  int courseCount = 0;

  @override
  Widget build(BuildContext context) {
    print("In course build");
    log(widget.courseName);
    log("$courseCount");

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              courseCount++;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.courseName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Count : $courseCount",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
