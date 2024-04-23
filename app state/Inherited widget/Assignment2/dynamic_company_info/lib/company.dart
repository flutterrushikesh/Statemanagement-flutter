import 'package:flutter/material.dart';
import 'inheritedwidget.dart';

class CompanyChange extends StatefulWidget {
  const CompanyChange({super.key});
  @override
  State createState() => _ChangeCompanyState();
}

class _ChangeCompanyState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change company"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              height: 128,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    blurRadius: 10,
                    offset: Offset(-4, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Employee count : ${Company.of(context).empCount}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Company name : ${Company.of(context).compName}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Company location : ${Company.of(context).compLoc}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Company.of(context).compLoc = "Bengluru";
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.blue.shade200,
                ),
              ),
              child: const Text(
                "Change company location",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
