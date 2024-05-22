import 'package:flutter/material.dart';

class MyMedications extends StatelessWidget {
  const MyMedications({super.key});
  static const String routName = "My Medications";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("My Medications"),
      ),
    );
  }
}
