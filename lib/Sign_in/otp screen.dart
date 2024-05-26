import 'package:be_safe3/Sign_in/new%20password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static const String routName = 'Otp Screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final defaultPinputTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: Colors.transparent)),
  );

  @override
  Widget build(BuildContext context) {
    final pinController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('OTP screen')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Verification code",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    "We have sent the code verification to your gmail",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Pinput(
              controller: pinController,
              length: 4,
              defaultPinTheme: defaultPinputTheme,
              focusedPinTheme: defaultPinputTheme.copyWith(
                decoration: defaultPinputTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.green),
                ),
              ),
              onCompleted: (pin) => debugPrint("pin is: $pin"),
            ),
            const SizedBox(height: 60),
            SizedBox(
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  'Confirm', //style: TextStyle(color:Colors.green.shade400 ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
