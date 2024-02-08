

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/network/local_storage.dart';
import 'package:taskati/features/profile/Upload.dart';
import 'package:taskati/features/home/home_page.dart';

class SplachPage extends StatefulWidget {
  const SplachPage({super.key});

  @override
  State<SplachPage> createState() => _SplachPageState();
}

class _SplachPageState extends State<SplachPage> {
 @override
  void initState() {
    super.initState();
    bool isupload =AppLocal.getCachData(AppLocal.ISUPLOAD_KEY)??false;
    Future.delayed(const Duration(seconds: 4),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => isupload?const Homepage() :const Uploadpage(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset('assets/Animation - 1706304369916.json'),
            const SizedBox(height: 20,),
            Text('Taskati',style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 20,),
            const Text('It\'is Time to Get Organized',style: TextStyle(fontSize: 18,color: Colors.grey),)
          ],
          
        ),
      ),
    );
  }

}
