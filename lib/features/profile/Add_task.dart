import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/home/home_page.dart';
import 'package:taskati/widget/custom_btm.dart';


import '../../core/utils/themes.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  var cotext = TextEditingController();
  var conot = TextEditingController();
  String date = DateFormat.yMd().format(DateTime.now());
  String starttime = DateFormat('hh:mm a').format(DateTime.now());
  String endtime =
      DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 15)));
  int colorindex = 0;
  late Box taskbox;

  @override
  void initState() {
    taskbox = Hive.box<Taskmodel>('task');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: AppColor.primartyColor),
        title: Center(
          child: Text('Add task',
              style: TextStyle(
                  color: AppColor.primartyColor, fontWeight: FontWeight.bold)),
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
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Gap(5),
              TextFormField(style: Theme.of(context).textTheme.displaySmall,
                  controller: cotext,
                  decoration: const InputDecoration(
                    hintText: 'Enter title here',
                  )),
              const Gap(10),
              Text(
                'Note',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Gap(5),
              TextFormField(style: Theme.of(context).textTheme.displaySmall,
                  maxLines: 4,
                  controller: conot,
                  decoration: const InputDecoration(
                    hintText: 'Enter note here',
                  )),
              const Gap(10),
              Text(
                'Date',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Gap(5),
              TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: date,
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialogDate();
                        },
                        icon: Icon(Icons.date_range_rounded,
                            color: AppColor.primartyColor),
                      ))),
              const Gap(10),
              Row(
                children: [
                  Text(
                    'Start Time',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const Gap(105),
                  Text(
                    'End Time',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ), const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 175,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: starttime,
                            suffixIcon: IconButton(
                              onPressed: () {
                                showDialogtime();
                              },
                              icon: Icon(Icons.access_time,
                                  color: AppColor.primartyColor),
                            )),
                      )),
                  SizedBox(
                      width: 175,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: endtime,
                            suffixIcon: IconButton(
                              onPressed: () {
                                showDialogtime();
                              },
                              icon: Icon(Icons.access_time,
                                  color: AppColor.primartyColor),
                            )),
                      )),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                colorindex = 0;
                              });
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColor.primartyColor,
                                child: (colorindex == 0)
                                    ? const Icon(Icons.check, color: Colors.white)
                                    : const SizedBox(
                                        height: 0,
                                      )),
                          ),
                          const Gap(5),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                colorindex = 1;
                              });
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColor.RedColor,
                                child: (colorindex == 1)
                                    ? const Icon(Icons.check, color: Colors.white)
                                    : const SizedBox(
                                        height: 0,
                                      )),
                          ),
                          const Gap(5),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                colorindex = 2;
                              });
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColor.orangColor,
                                child: (colorindex == 2)
                                    ? const Icon(Icons.check, color: Colors.white)
                                    : const SizedBox(
                                        height: 0,
                                      )),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 50,

                      child: customBottom(
                          onPressed: () {
                            String id =
                                '${cotext.text}${DateTime.now().millisecond}';
                            taskbox.put(
                                id,
                                Taskmodel(
                                    id: id,
                                    title: cotext.text,
                                    note: conot.text,
                                    date: date,
                                    starttime: starttime,
                                    endtime: endtime,
                                    color: colorindex,
                                    iscombleted: false));
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ));
                          },
                          text: 'Creat Task'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showDialogDate() async {
    var DatePicker = await showDatePicker(
        context: context,

        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (DatePicker != null) {
      setState(() {
        date = DateFormat.yMd().format(DatePicker);

      });
    }
  }

  showDialogtime() async {
    var TimePicker =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (TimePicker != null) {
      setState(() {
        int min = TimePicker.minute;
        starttime = TimePicker.format(context);
        endtime = TimePicker.replacing(minute: min + 15).format(context);
      });
    }
  }
}
