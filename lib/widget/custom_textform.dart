import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/profile/Upload.dart';

class CustomTextForm extends StatefulWidget {
   CustomTextForm({super.key,required this.hintText,this.icon});
 String hintText;
 Icon ?icon;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        onChanged: (value) {
         setState(() {
           name=value;
         });


        },
        decoration: InputDecoration(
          hintText: widget.hintText,hintStyle: TextStyle(fontSize: 18),
          suffixIcon: widget.icon,
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
        ));
  }
}
