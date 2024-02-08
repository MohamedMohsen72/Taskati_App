import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';
TextStyle getHeaderStyle({double FontSize =25,FontWeight fontWeight= FontWeight.bold ,Color color=const Color(0xff4E5AE8)}){
   return
      TextStyle(
          fontSize: FontSize,
          color: color,
          fontWeight: fontWeight,fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getTitelStyle({double FontSize = 22,FontWeight fontWeight= FontWeight.bold ,Color color=const Color(0xff4E5AE8)}){
   return
   TextStyle(
      fontSize: FontSize,
      color: color,
      fontWeight: fontWeight,fontFamily: GoogleFonts.poppins().fontFamily);
}
TextStyle getSmallStyle({double FontSize = 14,FontWeight fontWeight= FontWeight.normal,Color color= Colors.black}){
   return
      TextStyle(
          fontSize: FontSize ,
          color:color,
          fontWeight:fontWeight,fontFamily: GoogleFonts.poppins().fontFamily);
}
TextStyle getBodyStyle({double FontSize = 16,FontWeight fontWeight= FontWeight.bold,Color color= Colors.black}){
   return
      TextStyle(
          fontSize: FontSize,
          color:color,
          fontWeight:fontWeight,fontFamily: GoogleFonts.poppins().fontFamily);
}