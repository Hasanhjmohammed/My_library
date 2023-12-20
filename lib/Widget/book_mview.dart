import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../DataBase/sqf_db.dart';
import '../Function/animation_dialg.dart';
import '../Screens/add_book.dart';

import '../Screens/des_book.dart';
import '../Screens/main_book.dart';
class BooKMView extends StatelessWidget {
  String ?title;
  String ?subtitle;
  String ?path;
  String ?aother;
  int ?index;
   String ?date;
  MySql db_book=MySql();
   BooKMView({
     @required this.index,
     @required this.title,
     @required this.path,@required this.subtitle,
     @required this.aother,
     @required this.date

   });

  @override

  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: ()=>buildShowGeneralDialog(context,Container(
        child:  ListTile(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Are you want delet this notes'),
          ),
          subtitle: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
            ),
            onPressed: (){
              db_book.deletdatabase('DELETE FROM book WHERE id = $index');
              Navigator.of(context).pushAndRemoveUntil(PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: Ex()), (route) => false);
            },
            child: Icon(Icons.delete),
          ),
        ),
      )),
      onTap: ()=> Navigator.of(context).push( MaterialPageRoute(builder: (cont)=>DescruptionBook(
        index: index, title: title, path: path, subtitle: subtitle, aother: aother,date: date,)),),
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30)
            ),
            border: Border.all()
        ),
      //  height: 150,
        child:
        Row(
          children: [
             Expanded(
               flex: 1,
               child:  Hero(
               tag: '$index',
               child:ClipRRect(
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                 child:   Image.file(
                   File('$path'),

                 ),
               ),),),
            Expanded(
              flex:2,
                child:
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 70),
                    title:  Text('$title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    children: [
                      Text( "$subtitle",
                        overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$date',style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold

                        ),),
                        Padding(
                          padding: EdgeInsets.only(right: 25),
                          child:  Text('$aother',style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],),
                  ),
                ],
              ),
            ),
            ),
            
           ],
        ),
      ),
    );
  }
}
