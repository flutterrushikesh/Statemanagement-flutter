import 'package:dynamic_company_info/inheritedwidget.dart';
import 'package:flutter/material.dart';
import 'company.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
  TextEditingController empCountController = TextEditingController();
  TextEditingController compNameController = TextEditingController();
  TextEditingController compLocController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: empCountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Employee count",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: compNameController,
              decoration: InputDecoration(
                hintText: "Company name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: compLocController,
              decoration: InputDecoration(
                hintText: "Company Location",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return Company(
                        compLoc: compLocController.text,
                        compName: compNameController.text,
                        empCount: empCountController.text,
                        child: const CompanyChange(),
                      );
                    },
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.blue.shade200)),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
