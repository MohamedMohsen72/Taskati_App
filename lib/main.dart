import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/profile/Upload.dart';
import 'package:taskati/features/profile/splach_page.dart';
import 'package:taskati/features/profile/Add_task.dart';
import 'package:taskati/core/utils/themes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<bool>('mode');
  await Hive.openBox('user');
  Hive.registerAdapter<Taskmodel>(TaskmodelAdapter());
  await Hive.openBox<Taskmodel>('task');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>('mode').listenable(),
      builder: (context, value, child) {
       bool darkmode= value.get('darkmode', defaultValue: false)!;
        return MaterialApp(
          themeMode: darkmode ? ThemeMode.dark:ThemeMode.light,
          darkTheme: darktheme,
          theme: Lighttheme,
          debugShowCheckedModeBanner: false,
          home: const SplachPage(),
        );
      },

    );
  }
}
