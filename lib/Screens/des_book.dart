import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:mylib/Widget/cutom_dropdown.dart';

import '../Controller/updatetext.dart';
import '../DataBase/sqf_db.dart';
import '../Function/animation_dialg.dart';
import '../Widget/custom_Crad.dart';
import '../Widget/custom_drawer.dart';

class DescruptionBook extends StatelessWidget {
  String? title;
  String? path;
  String? subtitle;
  String? aother;
  String? date;
  int? index;
  DateTime? dat = DateTime.now();
  MySql db_book = MySql();
  UpdataText text = Get.find();
  DescruptionBook(
      {required this.index,
      @required this.title,
      @required this.path,
      @required this.subtitle,
      @required this.aother,
      @required this.date});

  @override
  Widget build(BuildContext context) {
    String? sub = CustonString(subtitle!);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Descruption Title'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Stack(
          children: [
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                '$title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: title!.length>20?20:30,
                  ),
                ),
              ),
              top: 0.0,
              left: 0.0,
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: context.height / 4,
                  width: context.width,
                  child: Card(
                    color: Colors.green.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '$sub',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,

                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              top: Get.height * 0.1,
              left: 0.0,
              right: 0.0,
            ),
            Positioned(
              child: InkWell(
                onTap: () => buildShowGeneralDialog(
                  context,
                  Container(
                    child: index! < 1000
                        ? Image.file(File('$path'))
                        : Image.asset('$path'),
                  ),
                ),
                child: Hero(
                  tag: '$index',
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 90,
                    child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.green,
                        backgroundImage: index! < 1000
                            ? FileImage(File('$path'))
                            : AssetImage('$path') as ImageProvider),
                  ),
                ),
              ),
              top: 20.0,
              right: 0.0,
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCard(
                        value: '$date',
                        callback: () async {
                          DateTime? my = await showDatePicker(
                              context: context,
                              initialDate: dat!,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100));
                          if (my == null)
                            return;
                          else {
                            dat = my;
                          }
                        }),
                    CustomCard(
                      value: aother,
                      callback: () => buildShowGeneralDialog(
                        context,
                        CustomDropDown(),
                      ),
                    ),
                  ],
                ),
              ),
              top: Get.height * 0.4,
              left: 0.0,
              right: 0.0,
            ),
          ],
        ),
      ),
    );
  }

  String CustonString(String s) {
    if (s.isEmpty)
      return '';
    else if (s.length < 18)
      return s;
    else if (s.length > 18 && s.length < 18 * 2)
      return '${s.substring(0, 18)}\n${s.substring(18, subtitle!.length)}';
    else
      return '${s.substring(0, 18)}\n${s.substring(18, 18 * 2)} \n ${s.substring(18 * 2, s.length)}';
  }
}
