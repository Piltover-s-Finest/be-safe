
import 'package:be_safe3/Sign_in/otp%20screen.dart';
import 'package:flutter/material.dart';

import 'FormField.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  static const String routName = 'Forget Password';
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Forget Password")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: PersonTextFormField(
                    icon: Icons.email_sharp,
                    hintText: "",
                    label: "Enter Your mail address",
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      setState(() {});
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter the email";
                      }
                      setState(() {});
                      setState(() {});
                      return null;
                    },
                    controller: email,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    checkAccount();
                    Navigator.pushNamed(context, OtpScreen.routName);
                    setState(() {});
                  },
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(81, 56, 238, 1),),),
                  color: const Color.fromRGBO(81, 56, 238, 1),
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "Send",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.5,),
                  ),
                ),
              ],),
        ),
      ),
    );
  }

  void checkAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
