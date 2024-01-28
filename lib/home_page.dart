import 'package:flutter/material.dart';
import 'package:taskati/core/color.dart';
import 'package:taskati/widget/custom_btm.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Text('Hello,Mohamed',
                        style: TextStyle(
                            fontSize: 25,
                            color: primartykay,
                            fontWeight: FontWeight.bold)),
                    Text('Have A Nice Day.',
                        style: TextStyle(
                          fontSize: 15,
                        ),),

                  ],
                ),
                Stack(alignment: Alignment.center,
                  children: [ CircleAvatar(radius: 55,backgroundColor: primartykay, ),
                    CircleAvatar(radius: 50,child: Image(image: AssetImage('assets/my1.jpg'),fit: BoxFit.cover),),

                      ],

                )
              ]),
              SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Text('October 30.2024',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Text('Today',
                      style: TextStyle(
                        fontSize: 15,
                      ),),

                  ],
                ),
                SizedBox(height: 50,
                    child: customBottom(text: "+ Add Task", onPressed: (){}))
              ]),

            ],
          ),
        ),
      ),
    );
  }
}
