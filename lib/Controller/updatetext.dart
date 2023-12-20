import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylib/DataBase/sqf_db.dart';
import 'package:mylib/Class/book.dart';
class UpdataText extends GetxController {

  List <Map<String ,Object ?>>res=[];
      Book myBook=Book();
      String changtitle(String value) {
      myBook.title =value;
    update();
    return myBook.title!;
  }
  void changsub(String value) {
    myBook.subtitle =value;
    update();
  }
 void chang( List <Map<String ,Object ?>>myres) {
   res=myres;
    update();
   // return res;
  }

  List <Map<String ,Object ?>>changr( List <Map<String ,Object ?>>myres) {
    res=myres;
    update();
     return res;
  }
}