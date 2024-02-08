import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/network/local_storage.dart';

import '../core/utils/color.dart';


showNameDailog(context, name) {
  var formkay = GlobalKey<FormState>();
  var textcom = TextEditingController(text: name);
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor:
    Theme.of( context).scaffoldBackgroundColor,
    context: context,
    builder: (BuildContext context) => Container(
        height: 210,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "your name mustn\'t by empty";
                    }
                    return null;
                  },
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall,
                  controller: textcom),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  if (formkay.currentState!.validate()) {
                    AppLocal.CachData(
                        AppLocal.NAME_KEY,
                        textcom.text);
                    Navigator.of(context).pop();

                  }
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(20),
                      color: AppColor.primartyColor),
                  child: Text('Update Your Name',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall),
                ),
              )
            ],
          ),
        )),
  );
}
