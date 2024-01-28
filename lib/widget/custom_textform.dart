import 'package:flutter/material.dart';
import 'package:taskati/core/color.dart';

class CustomTextForm extends StatelessWidget {
   CustomTextForm({super.key,required this.hintText,this.icon});
 String hintText;
 Icon ?icon;
  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        decoration: InputDecoration(
          hintText: hintText,hintStyle: TextStyle(fontSize: 18),
          suffixIcon: icon,
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:primartykay)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: primartykay)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: primartykay)),
        ));
  }
}
