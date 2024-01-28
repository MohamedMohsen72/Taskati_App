import 'package:flutter/material.dart';
import 'package:taskati/features/profile/Upload.dart';
import 'package:taskati/features/profile/splach_page.dart';
import 'package:taskati/screen/Add_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
home:  AddTask (),
    );
  }
}
