import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/network/local_storage.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/textstyle.dart';
import 'package:taskati/features/profile/data_user.dart';
import 'package:taskati/screen/Add_task.dart';
import 'package:taskati/widget/custom_btm.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color Getcolor (index){
    if(index==0){
      return AppColor.primartyColor;
    }else if(index==1){
      return Colors.red;
    }else if(index==2){
     return Colors.orange;
    }else {return Colors.green;
    }
  }
  String? name;
  String? path;

  @override
  void initState() {
    name = AppLocal.getCachData(AppLocal.NAME_KEY);
    path = AppLocal.getCachData(AppLocal.IMAGE_KEY);
    super.initState();

  }

  String selectedValue = DateFormat.yMd().format(DateTime.now());
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
                    Text('Hello,${name?.split(' ').first}',
                        style: TextStyle(
                            fontSize: 22,
                            color: AppColor.primartyColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                    Text(
                      'Have A Nice Day.',
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 37,
                      backgroundColor: AppColor.primartyColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DataUser(),
                        ));
                      },
                      child: CircleAvatar(
                          radius: 37,
                          backgroundImage: path != null
                              ? FileImage(File(path!)) as ImageProvider
                              : const AssetImage('assets/person-shape.png')),
                    ),
                  ],
                )
              ]),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now()),
                        style: Theme.of(context).textTheme.displayMedium),
                    Text(
                      'Today',
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                  ],
                ),
                SizedBox(
                    height: 50,
                    child: customBottom(
                        text: "+ Add Task",
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => const AddTask(),
                          ));
                        }))
              ]),
              const Gap(10),
              DatePicker(
                width: 80,
                height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColor.primartyColor,
                selectedTextColor: Colors.white,
                dayTextStyle:  Theme.of(context).textTheme.displaySmall!,
                monthTextStyle:  Theme.of(context).textTheme.displaySmall!,
                dateTextStyle:Theme.of(context).textTheme.displaySmall! ,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    selectedValue = DateFormat.yMd().format(date);

                  });
                },
              ),
              Expanded(
                child: ValueListenableBuilder<Box<Taskmodel>>(
                  valueListenable: Hive.box<Taskmodel>('task').listenable(),
                  builder: (context, Box<Taskmodel> value, child) {
                    List<Taskmodel> tasks = [];

                    for (var element in value.values) {
                      if (selectedValue == element.date) {
                        tasks.add(element);
                      }
                    }

                    return   tasks.isEmpty? Column(
                      children: [
                        const Gap(80),
                        const Image(image: AssetImage('assets/empty.png'),width: 200),
                         const Gap(10),
                         Text('You do not have any tasks yet!',style: Theme.of(context).textTheme.displaySmall),
                        Text('Add new tasks.',style: Theme.of(context).textTheme.displaySmall)
                      ],
                    ):
                    ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        Taskmodel task = tasks[index];
                        return Dismissible(
                          onDismissed: (direction) {
                            if(direction==DismissDirection.startToEnd){

                              value.put(task.id, Taskmodel(id: task.id, title:task. title, note:task. note, date:task. date, starttime: task.starttime, endtime: task.endtime, color: 3, iscombleted: true));
                            }else{
                              value.delete(task.id);
                            }
                          },
                          key: UniqueKey(),
                          secondaryBackground: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(decoration: BoxDecoration( color: Colors.red,borderRadius: BorderRadius.circular(15)),

                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(Icons.delete,color: Colors.white),
                                      Text('dalet',style: getSmallStyle(color: Colors.white),),
                                    ],
                                  ),
                                )),
                          ),
                         background: Padding(
                           padding: const EdgeInsets.all(10),
                           child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),

                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.check,color: Colors.white),
                                      Text('complet',style: getSmallStyle(color: Colors.white),),
                                    ],
                                  ),
                                )),
                         ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Getcolor (task.color)),
                            child: Row(children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title,
                                    style: getTitelStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      FontSize: 20,
                                    ),
                                  ),
                                  const Gap(5),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time,
                                          color: Colors.white),
                                      const Gap(5),
                                      Text('${task.starttime}-${task.endtime}',
                                          style: getSmallStyle(FontSize: 16,color: Colors.white)),
                                    ],
                                  ),
                                  const Gap(5),
                                  Text(
                                    task.note,
                                    style: getTitelStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        FontSize: 20),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 90,
                                width: .5,
                                color: Colors.white,
                              ),
                              const Gap(5),
                              RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    (task.iscombleted) ? 'COMPLETED' : 'ToDO',
                                    style: getSmallStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ))
                            ]),
                          ),
                        );
                      },
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
