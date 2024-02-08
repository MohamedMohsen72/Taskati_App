import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/network/local_storage.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/home/home_page.dart';
import 'package:taskati/features/profile/Upload.dart';
import 'package:taskati/widget/custom_btm.dart';
import 'package:taskati/widget/show_dailogs.dart';
String name=' ';

class DataUser extends StatefulWidget {
  const DataUser({super.key});

  @override
  State<DataUser> createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  late Box<bool> modebox;
  String? path;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modebox = Hive.box('mode');
    path = AppLocal.getCachData(AppLocal.IMAGE_KEY);
    name=AppLocal.getCachData(AppLocal.NAME_KEY);
  }

  @override
  Widget build(BuildContext context) {
    bool isdark = modebox.get('darkmode') ?? false;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    modebox.put('darkmode', !isdark);
                  });
                },
                icon: Icon(isdark ? Icons.nightlight : Icons.sunny),
                color: AppColor.primartyColor)
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
            },
            icon: const Icon(Icons.arrow_back),
            color: AppColor.primartyColor,
          )),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage('assets/person-shape.png'),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    context: context,
                    builder: (context) => Container(
                      height: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: customBottom(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                  uploadFromeCamera();
                                },
                                text: 'Upload From Camera',
                              ),
                            ),
                          ),
                          const Gap(20),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: customBottom(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                  uploadFromeGalery();
                                },
                                text: 'Upload From Galary',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt),
                color: AppColor.primartyColor,
              )
            ],
          ),
          const Gap(50),
          Divider(
            thickness: 2,
            color: AppColor.primartyColor,
            endIndent: 30,
            indent: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primartyColor,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.primartyColor,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: IconButton(
                          icon: Icon(Icons.edit, color: AppColor.primartyColor),
                          onPressed: () {
                            showNameDailog(context, name);
                          }),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  uploadFromeCamera() async {
    var pikerImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pikerImage != null) {
      setState(() {
        path = pikerImage.path;
      });
    }
  }

  uploadFromeGalery() async {
    var pikerImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pikerImage != null) {
      setState(() {
        path = pikerImage.path;
      });
    }
  }
}
