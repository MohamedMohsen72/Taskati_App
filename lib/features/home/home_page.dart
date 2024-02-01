import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/network/local_storage.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/textstyle.dart';
import 'package:taskati/screen/Add_task.dart';
import 'package:taskati/widget/custom_btm.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? name;
  String ?path;
  @override
  void initState() {
    name = AppLocal.getCachData(AppLocal.NAME_KEY);
    path =AppLocal.getCachData(AppLocal.IMAGE_KEY);
    super.initState();
  }
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,$name',
                        style: TextStyle(
                            fontSize: 25,
                            color: AppColor.primartyColor,
                            fontWeight: FontWeight.bold)),
                    Text(
                      'Have A Nice Day.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 33,
                      backgroundColor: AppColor.primartyColor,
                    ),
                    CircleAvatar(
                        radius: 30,
                        backgroundImage: path!=null ? FileImage(File(path!))as ImageProvider :
                        AssetImage('assets/person-shape.png')),
                  ],
                )
              ]),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 50,
                    child: customBottom(text: "+ Add Task", onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AddTask(),));
                    }))
              ]),
              Gap(10),
              DatePicker(
                width: 80,
                height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor:AppColor.primartyColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  /*setState(() {
                    _selectedValue = date;
                  });*/
                },
              ),

              Expanded(
                child: ListView.builder(itemCount: 3,
                  itemBuilder: (context, index) {

                    return Container(margin:EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.primartyColor),
                      child: Row(children: [

                        Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter_task1',
                              style: getTitelStyle(color:Colors.white ,fontWeight: FontWeight.normal,FontSize: 20),
                            ),Gap(5),
                            Row(
                              children: [
                                Icon(Icons.access_time,color: Colors.white),
                                Gap(5),
                                Text('12:00-12:02',style:getSmallStyle(FontSize: 16)),
                              ],
                            ),
                            Gap(5),
                            Text(
                              'Flutter_task1 nottttttt',
                              style:  getTitelStyle(color:Colors.white ,fontWeight: FontWeight.normal,FontSize: 20 ),
                            ),
                          ],

                        ),
                      Spacer(),

                      Container(

                        height: 90,width: .5,color: Colors.white,
                      ),Gap(5),
                        RotatedBox(quarterTurns: 3,child: Text('ToDO',style: getSmallStyle(color: Colors.white,fontWeight: FontWeight.normal),))


                      ]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
