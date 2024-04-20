import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Company(name: "Microsoft", empCount: 450),
      child: const MaterialApp(
        home: ShowData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<Company>(context, listen: false).name),
            const SizedBox(
              height: 30,
            ),
            Text("${Provider.of<Company>(context, listen: false).empCount}"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Company>(context, listen: false).name = "Metaa";
                setState(() {});
              },
              child: const Text("Change Company Name"),
            ),
          ],
        ),
      ),
    );
  }
}

class Company {
  String name;
  int empCount;

  Company({required this.name, required this.empCount});
}
