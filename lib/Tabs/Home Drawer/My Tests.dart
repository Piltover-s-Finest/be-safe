import 'package:flutter/material.dart';

class MyTests extends StatelessWidget {
  const MyTests({super.key});
  static const String routName = "My Tests";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("My Tests"),
      ),
    );
  }
}
