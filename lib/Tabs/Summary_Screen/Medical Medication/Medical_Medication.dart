import 'package:be_safe3/Tabs/Summary_Screen/Medical%20Medication/Add%20the%20Medication%20concentration.dart';
import 'package:flutter/material.dart';

class MedicalMedication extends StatefulWidget {
  static const String routName = "Medical Medication";

  const MedicalMedication({super.key});

  @override
  State<MedicalMedication> createState() => _MedicalMedicationState();
}

class _MedicalMedicationState extends State<MedicalMedication> {
  int select1 = 0;
  int select2 = 0;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Medication"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                heightFactor: 1.2,
                child: Image.asset("assets/images/medication.png"),),
            const SizedBox(
              height: 1,
            ),
            const Center(
                child: Text(
              "Select Type of Medication",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "  Common Shapes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 235,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff89c2d9),
              ),
              child: Column(
                children: [
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text(
                        "Capsule",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: 1,
                      groupValue: select1,
                      onChanged: (val) {
                        setState(() {
                          select1 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Tablet",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 2,
                      groupValue: select1,
                      onChanged: (val) {
                        setState(() {
                          select1 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Liquid",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 3,
                      groupValue: select1,
                      onChanged: (val) {
                        setState(() {
                          select1 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Topical",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 4,
                      groupValue: select1,
                      onChanged: (val) {
                        setState(() {
                          select1 = val!;
                        });
                      },),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("  More Shapes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 750,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff89c2d9),
              ),
              child: Column(
                children: [
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text(
                        "Device",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: 1,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Inhaler",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 2,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Generation",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 3,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Injection",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 4,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Mouth",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 5,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Rush",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 6,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Foam",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 7,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Lotion",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 8,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Drops",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 9,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Generous",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 10,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Adhesive",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 11,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Suppositories",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 12,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                  const Divider(color: Colors.black, height: 1),
                  RadioListTile(
                      activeColor: Colors.black,
                      title: const Text("Powder",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      value: 13,
                      groupValue: select2,
                      onChanged: (val) {
                        setState(() {
                          select2 = val!;
                        });
                      },),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      showErrors();
                      Navigator.pushNamed(
                          context, AddMedicationConcentration.routeName,);
                      setState(() {});
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,),
                        ),),),),
          ],
        ),
      ),
    );
  }

  void showErrors() {
    showError = false;
    }
}
