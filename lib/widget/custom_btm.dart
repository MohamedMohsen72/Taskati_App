
import 'package:flutter/material.dart';
import 'package:taskati/core/color.dart';

class customBottom extends StatelessWidget {
  customBottom({super.key, required this.text,required this.onPressed});
  String text;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text (text,style: TextStyle(fontSize: 15)),
        style: ElevatedButton.styleFrom(

            foregroundColor: Colors.white,
            backgroundColor: primartykay,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))
    )
    ;
  }
}
