import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylib/DataBase/sqf_db.dart';



class CustomSteper extends GetxController {
  var count = 0;
  bool islo=false;
  MySql mySql=MySql();
  void increment(BuildContext context) async{
    count++;

      update();
  }
  void decrement(BuildContext context) {

    if(count>0)
    {    count--;
         update();
    }

      update();

  }

  void ch(int co) {
    count=co;
    update();
  }

  void ci() {
    islo=!islo;
    update();
  }
}