import 'package:be_safe3/Apis/dio_client.dart';
import 'package:be_safe3/Apis/exceptions.dart';
import 'package:be_safe3/Apis/repository.dart';
import 'package:be_safe3/Hospital/HomeScreen.dart';
import 'package:be_safe3/Sign_in/FormField.dart';
import 'package:be_safe3/Sign_in/Sign_up.dart';
import 'package:be_safe3/Sign_in/forgetpassword.dart';
import 'package:be_safe3/Sign_in/validation.dart';
import 'package:be_safe3/signals/api_signals.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  width: 10,
                  height: 80,
                ),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter to get unlimited access to data & information",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: const Row(
                    children: [
                      Text(
                        "Email ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                PersonTextFormField(
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
                    if (!emailValidation(text)) {
                      return "bad format";
                    }
                    setState(() {});
                    return null;
                  },
                  controller: email,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: const Row(
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                PersonTextFormField(
                  icon: Icons.remove_red_eye,
                  hintText: "",
                  label: "Enter Your Password",
                  keyboardType: TextInputType.visiblePassword,
                  validator: passwordValidation,
                  controller: password,
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 240),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ForgetPassword.routName,
                            );
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(
                              color: Color.fromRGBO(81, 56, 238, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    checkAccount();
                    Navigator.pushNamed(
                      context,
                      HospitalHomePage.routeName,
                    );
                    setState(() {});
                  },
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(81, 56, 238, 1),
                    ),
                  ),
                  color: const Color.fromRGBO(81, 56, 238, 1),
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text("Don't have an account ?"),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SignUp.routName,
                            );
                          },
                          child: const Text(
                            "Register here",
                            style: TextStyle(
                              color: Color.fromRGBO(81, 56, 238, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkAccount() {
    if (formKey.currentState?.validate() == true) {
      // add code to login here
    }
  }
}
