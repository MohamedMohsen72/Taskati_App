import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/profile/Upload.dart';

class DataUser extends StatefulWidget {
  const DataUser({super.key});

  @override
  State<DataUser> createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.sunny), color: AppColor.primartyColor)
          ],
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Uploadpage()));
              });
            },
            icon: Icon(Icons.arrow_back),
            color: AppColor.primartyColor,
          )),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/person-shape.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt),
                color: AppColor.primartyColor,
              )
            ],
          ),
          Gap(50),
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
                  'Mohamed Mohsen Eldeeb',
                  style: TextStyle(
                      fontSize: 23,fontWeight: FontWeight.bold,
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
                      backgroundColor: Colors.white,
                      child: IconButton(
                          icon: Icon(Icons.edit, color: AppColor.primartyColor),
                          onPressed: () {}),
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
}
