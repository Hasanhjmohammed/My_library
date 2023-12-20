import 'package:flutter/material.dart';
import 'package:mylib/Screens/ex.dart';
import 'package:mylib/Screens/main_book.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'Function/shardprefrances.dart';
import 'Screens/wlecom.dart';
import 'package:get/get.dart';


late SharedPreferences myShared;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   myShared=await SharedPreferences.getInstance();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  bool check=false;
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(

  primaryColorLight: Colors.greenAccent,
  appBarTheme: AppBarTheme(
    iconTheme:  IconThemeData(color: Colors.black.withOpacity(0.5)),
    titleSpacing: 20,
    color: Colors.green,
    titleTextStyle: TextStyle(
      color: Colors.black.withOpacity(0.5),
        fontSize: 20,
    ),
  ),
           buttonTheme: ButtonThemeData(

             buttonColor: Colors.green
           ),

           cardColor: Colors.greenAccent,

  iconTheme: IconThemeData(color: Colors.green
  ),

    primarySwatch: Colors.green,
),
         debugShowCheckedModeBanner: false,

        home:myShared.getBool('check')==true?Ex():Welcom()
    );
  }
}


