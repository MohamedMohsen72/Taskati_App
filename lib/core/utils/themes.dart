import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/textstyle.dart';

final Lighttheme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.primartyColor),
        titleTextStyle: getTitelStyle(),
        backgroundColor: Colors.transparent),
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        displayLarge: getHeaderStyle(),
        displayMedium: getBodyStyle( FontSize: 20),
        displaySmall: getSmallStyle(FontSize: 18)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(fontSize: 18,color:Colors.grey ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primartyColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primartyColor)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primartyColor)),
    ));

final darktheme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.primartyColor),
        titleTextStyle: getTitelStyle(),
        backgroundColor: Colors.transparent),
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: const Color(0xff121212),
    textTheme: TextTheme(
        displayLarge: getHeaderStyle(color: Colors.white),
        displayMedium: getBodyStyle(color: Colors.white, FontSize: 20),
        displaySmall: getSmallStyle(color: Colors.white,FontSize: 18)),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(fontSize: 16,color:Colors.grey ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primartyColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primartyColor)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primartyColor)),
    ));
