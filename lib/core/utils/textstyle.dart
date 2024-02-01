import 'package:flutter/material.dart';

import 'color.dart';

TextStyle getTitelStyle({double FontSize = 18,FontWeight fontWeight= FontWeight.bold ,Color color=const Color(0xff4E5AE8)}){
   return
   TextStyle(
      fontSize: FontSize,
      color: color,
      fontWeight: fontWeight);
}
TextStyle getSmallStyle({double FontSize = 14,FontWeight fontWeight= FontWeight.normal,Color color= Colors.white}){
   return
      TextStyle(
          fontSize: FontSize ,
          color:color,
          fontWeight:fontWeight);
}
TextStyle getBodyStyle({double FontSize = 16,FontWeight fontWeight= FontWeight.bold,Color color= Colors.black}){
   return
      TextStyle(
          fontSize: FontSize,
          color:color,
          fontWeight:fontWeight);
}