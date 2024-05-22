import 'package:be_safe3/Sign_in/Login.dart';
import 'package:be_safe3/Sign_in/otp%20screen%20sign%20up.dart';
import 'package:be_safe3/Sign_in/validation.dart';
import 'package:flutter/material.dart';

import 'FormField.dart';
import '../HomeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const String routName = 'SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                                fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Enter to get unlimited access to data & information",
                            style: TextStyle(color: Colors.blueGrey),

                          ),
                          const SizedBox(height: 40,),

                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              child: const Row(
                                children: [
                                  Text("Name ", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),),
                                  Text("*",
                                    style: TextStyle(color: Colors.redAccent),),
                                ],
                              )),
                          const SizedBox(
                            height: 9,
                          ),
                          PersonTextFormField(
                            icon: Icons.person,
                            hintText: "",
                            label: "Enter Your name ",
                            keyboardType: TextInputType.name,
                            validator: userNameValidation,
                            controller: username,
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              child: const Row(
                                children: [
                                  Text("phone ", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),),
                                  Text("*",
                                    style: TextStyle(color: Colors.redAccent),),
                                ],
                              )),
                          const SizedBox(
                            height: 9,
                          ),
                          PersonTextFormField(
                            icon: Icons.phone,
                            hintText: "",
                            label: "Enter Your phone",
                            keyboardType: TextInputType.phone,
                            maxLength: 11,
                            validator: (val){
                              if(phone.text.length !=11){
                           return "please Enter valid mobile number";
                              }
                              return null;
                            },
                            controller: phone ,

                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              child: const Row(
                                children: [
                                  Text("Email ", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),),
                                  Text("*",
                                    style: TextStyle(color: Colors.redAccent),),
                                ],
                              )),
                          const SizedBox(
                            height: 9,
                          ),
                          PersonTextFormField(
                            icon: Icons.email_sharp,
                            hintText: "",
                            label: "Enter Your mail address",
                            keyboardType: TextInputType.emailAddress,
                            validator:(text){
                              if (text == null || text.trim().isEmpty) {
                                return "please Enter the email";
                              }
                              if(!emailValidation(text)){
                                return "bad format";
                              }
                              return null ;
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
                                Text("Password", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),),
                                SizedBox(width: 3,),
                                Text("*", style: TextStyle(
                                    color: Colors.redAccent, fontSize: 15),)
                              ],
                            ),
                          ),
                          const SizedBox(height: 9,),
                          PersonTextFormField(
                            icon: Icons.remove_red_eye,
                            hintText: "",
                            label: "Enter Your Password",
                            keyboardType: TextInputType.visiblePassword,
                            validator: passwordValidation,
                            controller: password,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(height: 10,),
                          MaterialButton(
                            onPressed: () {
                             checkAccount();
                              Navigator.pushNamed(context,HomePage.routName);

                              setState(() {});
                            },
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(81, 56, 238, 1)
                                )
                            ),
                            color: const Color.fromRGBO(81, 56, 238, 1),
                            minWidth: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.5),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 60),
                            child: Row(
                              children: [
                                const Text("Don't have an account ?"),
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          LoginScreen.routName);
                                    },
                                    child:
                                    const Text(
                                      "Login here", style: TextStyle(
                                        color: Color.fromRGBO(
                                            81, 56, 238, 1)),))
                              ],
                            ),
                          )

                        ]
                    )
                )
            )
        )
    );
  }
  void checkAccount(){
    if(formKey.currentState?.validate()==false){
      return ;
    }
  }
}
