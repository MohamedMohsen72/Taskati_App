import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/network/local_storage.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/profile/data_user.dart';
import 'package:taskati/features/home/home_page.dart';
import 'package:taskati/widget/custom_btm.dart';
import 'package:taskati/widget/custom_error_dialog.dart';
import 'package:taskati/widget/custom_textform.dart';
String ? path;
String  name='';
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
            if(path!=null&& name.isNotEmpty){
              Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => Homepage(),));
            AppLocal.CachData(AppLocal.IMAGE_KEY, path);
            AppLocal.CachData(AppLocal.NAME_KEY, name);
              AppLocal.CachData(AppLocal.ISUPLOAD_KEY, true);
            }
            else if(path==null&& name.isNotEmpty){
              showErrorDialog(context,Text('please uploud your image'));
            }
            else if(path!=null&& name.isEmpty){
              showErrorDialog(context,Text('please Enter your name'));
            }
            else {
              showErrorDialog(context,Text('please Enter your name and uploud your image'));

            }
          },
              child: Text('Done'))]),
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
            color: AppColor.primartyColor,
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:TextFormField( inputFormatters: [
                 FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'))
            ],
                onChanged: (value) {
                  setState(() {
                    name=value;
                  });


                },
                decoration: InputDecoration(
                  hintText:'Enter your name',hintStyle: TextStyle(fontSize: 18),

                  enabledBorder:OutlineInputBorder(

                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:AppColor.primartyColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColor.primartyColor)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColor.primartyColor)),
                ))
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
