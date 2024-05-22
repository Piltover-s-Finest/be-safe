import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class PersonTextFormField extends StatelessWidget {
  String hintText,label;
  TextEditingController? controller;
  TextInputType keyboardType;
  Validator? validator;
  IconData icon;
  int maxLength ;
  PersonTextFormField(
      {super.key,
        required this.hintText,
        this.keyboardType = TextInputType.text,
        this.controller,
        this.validator,
        this.maxLength=11,
        required this.label,
        required this.icon,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ,
      controller: controller,
      keyboardType: keyboardType,

      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          label: Text(label),
          hintText: hintText,
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
