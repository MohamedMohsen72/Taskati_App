import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/color.dart';
import 'package:taskati/features/profile/data_user.dart';
import 'package:taskati/home_page.dart';
import 'package:taskati/widget/custom_btm.dart';
import 'package:taskati/widget/custom_textform.dart';
String ? path;

class Uploadpage extends StatefulWidget {
  const Uploadpage({super.key});

  @override
  State<Uploadpage> createState() => _UploadpageState();
}

class _UploadpageState extends State<Uploadpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(actions: [TextButton(onPressed: () {
            setState(() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DataUser()));
            });
          }, child: Text('Done'))]),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 75,
            backgroundImage: (path!=null)?FileImage(File(path!))as ImageProvider:
            AssetImage('assets/person-shape.png'),
          ),
          Gap(20),
          SizedBox(width: 200,height: 60,
            child: customBottom(
              onPressed: () {
                uploadFromeCamera();
              },
              text: 'Upload From Camera',
            ),
          ),
          Gap(20),
          SizedBox(width: 200,height: 60,
            child: customBottom(
              onPressed: () {
                uploadFromeGalery();
              },
              text: 'Upload From Galary',
            ),
          ),
          Gap(20),
          Divider(
            height: 5,
            indent: 30,
            endIndent: 30,
            color: primartykay,
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTextForm(hintText: ('Enter your name'),)
          )
        ]),
      ),
    );
  }
  uploadFromeCamera() async {
    var pikerImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pikerImage !=null){
      setState(() {
        path=pikerImage.path;
      });

    }

  }
  uploadFromeGalery() async {
    var pikerImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pikerImage !=null){
      setState(() {
        path=pikerImage.path;
      });

    }}
}
