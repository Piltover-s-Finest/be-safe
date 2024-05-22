import 'package:flutter/material.dart';

class MyMedicalPaper extends StatelessWidget {
  const MyMedicalPaper({super.key});
  static const String routName = "MY Medical paper";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("My Medical Paper"),
      ),
    );
  }
}
