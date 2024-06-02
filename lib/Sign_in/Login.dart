import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:math';

import 'package:be_safe3/Apis/exceptions.dart';
import 'package:be_safe3/Hospital/HomeScreen.dart';
import 'package:be_safe3/Sign_in/FormField.dart';
import 'package:be_safe3/Sign_in/Sign_up.dart';
import 'package:be_safe3/Sign_in/forgetpassword.dart';
import 'package:be_safe3/Sign_in/validation.dart';
import 'package:be_safe3/Tabs/Summary_Screen/Summary_Screen.dart';
import 'package:be_safe3/models/user_model.dart';
import 'package:be_safe3/signals/api_signals.dart';
import 'package:be_safe3/signals/prefs_signal.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';

import 'otp screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();

  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                  validator: qValidator([
                    IsRequired("Please enter your email"),
                    const IsEmail("Please enter a valid email"),
                  ]),
                  // (text) {
                  //   setState(() {});
                  //   if (text == null || text.trim().isEmpty) {
                  //     return "please Enter the email";
                  //   }
                  //   setState(() {});
                  //   if (!emailValidation(text)) {
                  //     return "bad format";
                  //   }
                  //   setState(() {});
                  //   return null;
                  // },
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
                  isHide: true,
                  icon: Icons.remove_red_eye,
                  hintText: "",
                  label: "Enter Your Password",
                  keyboardType: TextInputType.visiblePassword,
                  validator: qValidator([
                    IsRequired(),
                  ]),
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
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    if (formKey.currentState?.validate() == true) {
                      try {
                        UserModel userModel = await repoSignal.value.login(
                          email: email.text,
                          password: password.text,
                        );

                        userModelSignal.value = userModel;
                        final String jsonString = jsonEncode(userModel);

                        prefs.setString("userModel",jsonString);

                        if (!context.mounted) return;

                        Navigator.of(context).pushNamedAndRemoveUntil(
                          SummaryScreen.routName,
                          (Route<dynamic> route) => false,
                        );
                      } on ApiException catch (e) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          title: 'Oops...',
                          text: e.message,
                          backgroundColor: Colors.black,
                          titleColor: Colors.white,
                          textColor: Colors.white,
                          onConfirmBtnTap: () {
                            repoSignal.value.sendEmailVerification(email.text);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OtpScreen(email: email.text)),
                              (Route<dynamic> route) => false,
                            );
                          },
                        );
                      }
                    }
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

  // Future<void> checkAccount() async {
  //   log('${email.text} | ${password.text}');

  //   if (formKey.currentState?.validate() == true) {
  //     try {
  //       final repo = repoSignal.value;
  //       await repo.login(email.text, password.text);

  //       while (Navigator.of(context).canPop()) {
  //         Navigator.pop(context);
  //       }
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => SummaryScreen()),
  //       );
  //     } on ApiException catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(e.message),
  //         ),
  //       );
  //     }
  //   }
  // }
}
