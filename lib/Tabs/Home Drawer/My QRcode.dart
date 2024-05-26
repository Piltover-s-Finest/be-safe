import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class MyQRCode extends StatefulWidget {
  MyQRCode({super.key});
  static const String routName = 'My QR Code';
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  State<MyQRCode> createState() => _MyQRCodeState();
}

class _MyQRCodeState extends State<MyQRCode> {
  var qrcode = 'Add Data';
  var qrcode1 = 'Add Data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Qr Code"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: BarcodeWidget(
                data: [qrcode, qrcode1].toString(),
                barcode: Barcode.qrCode(),
                color: Colors.blue,
                height: 200,
                width: 200,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                child: TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (val) {
                    setState(() {
                      qrcode = val;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: "your ID",
                      fillColor: Colors.deepOrange,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                      ),),),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
                child: TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (val1) {
                    setState(() {
                      qrcode1 = val1;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: "your Email",
                      fillColor: Colors.deepOrange,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                      ),),),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
