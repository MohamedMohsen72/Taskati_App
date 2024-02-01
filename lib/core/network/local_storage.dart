

import 'package:hive_flutter/adapters.dart';

class AppLocal{
  static String IMAGE_KEY='IMAGE';
  static String NAME_KEY='NAME';
  static String ISUPLOAD_KEY='ISUPLOAD';
  static CachData(String key,value){
    var box = Hive.box('user');
box.put(key, value);
  }
  static getCachData(String key){
    var box = Hive.box('user');
    return box.get(key);

  }
}