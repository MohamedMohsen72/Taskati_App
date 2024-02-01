

 import 'package:flutter/material.dart';

showErrorDialog(context,text){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       behavior: SnackBarBehavior.floating, backgroundColor:Colors.red,content:text ));
 }