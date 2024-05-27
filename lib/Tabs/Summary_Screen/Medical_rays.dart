import 'package:be_safe3/Tabs/Home%20Drawer/My%20Rays.dart';
import 'package:be_safe3/image_function.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MedicalRays extends StatefulWidget {
  static const String routName = "Medical Rays";

  const MedicalRays({super.key});

  @override
  State<MedicalRays> createState() => _MedicalRaysState();
}

class _MedicalRaysState extends State<MedicalRays> {
  File? _img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff52B788),
        title: const Text(
          "Add Medical Rays",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff0077b6),
                  ),
                  child: InkWell(
                    onTap: () async {
                      File? temp = await ImageFunction.galleryPicker();
                      if (temp != null) {
                        _img = temp;
                      }
                      setState(() {});
                    },
                    child: const Icon(Icons.photo_library),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff0077b6),
                  ),
                  child: InkWell(
                    onTap: () async {
                      File? temp = await ImageFunction.cameraPicker();
                      if (temp != null) {
                        _img = temp;
                      }
                      setState(() {});
                    },
                    child: const Icon(Icons.photo_camera_outlined),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gallery",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 35,
                ),
                Text(
                  "Camera",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 330,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              child: Center(
                child: _img == null ? null : Image.file(_img!),
              ),

              //   child:CircleAvatar(
              //   backgroundImage: pickedImage==null?null:FileImage(pickedImage!),
              //   )
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Write Comment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 380,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit_note_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    child: const Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRays.routName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                  ),
                  child: const Text(
                    "view",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
