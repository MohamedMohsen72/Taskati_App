import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/color.dart';
import 'package:taskati/widget/custom_btm.dart';
import 'package:taskati/widget/custom_textform.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xfff9f9f9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
            color: primartykay),
        title: Center(
          child: Text('Add task',
              style:
                  TextStyle(color: primartykay, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              CustomTextForm(
                hintText: 'Enter title here',
              ),
              Gap(10),
              Text(
                'Note',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              CustomTextForm(
                hintText: 'Enter note here',
              ),
              Gap(10),
              Text(
                'Date',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              CustomTextForm(
                  hintText: '10/30/2024', icon: Icon(Icons.date_range)),
              Gap(10),
              Row(
                children: [
                  Text(
                    'Start Time',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Gap(105),
                  Text(
                    'End Time',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 175,
                      child: CustomTextForm(
                          hintText: '02:00 AM', icon: Icon(Icons.access_time))),
                  SizedBox(
                      width: 175,
                      child: CustomTextForm(
                          hintText: '02:45 AM', icon: Icon(Icons.access_time))),
                ],
          
              ),
              Gap(10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      ),
          
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: primartykay,
                          ),
                          Gap(8),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                          ),Gap(8),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.deepOrange,
                          )
                        ],
                      ),
                    ],
          
                  ),
                  SizedBox(height: 50,width: 120,
                      child: customBottom(onPressed: (){},text: 'Creat Task'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
