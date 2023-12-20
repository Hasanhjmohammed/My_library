import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../Screens/des_book.dart';

class BookView extends StatelessWidget {
  int ?index;
  String ?title;
  String ?path;
  String ?subtitle;
   String ?aother;
     String ?date;
   BookView({
     @override this.index,
     @override this.path,
     @override this.title,
     @override this.subtitle,
     @override this.aother,
     @override this.date,

   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).push(
        MaterialPageRoute(builder: (cont)=>DescruptionBook(index: index,
            title: title,
            path: path,
            subtitle: subtitle,
            aother: aother,
            date: date),),),
      child: RotatedBox(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border:  Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12.withOpacity(0.1)
            ),
            child: Column(
              children: [
               Padding(padding: EdgeInsets.all(10),
                 child:  Text('$title ',style: TextStyle(
                     color: Colors.green,
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                 ),),),
               Expanded(
                 flex: 1,
                  child: Padding(
                      padding: EdgeInsets.all(0),
                      child:
                      Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            child:

                            Image.asset('$path',fit: BoxFit.fitWidth,
                            width: double.infinity,
                            ),
                            // SvgPicture.asset('$path',
                            //   fit: BoxFit.fitWidth,
                            //   width: double.infinity,),

                           // Image.file(File('$path'),
                            //  height: 100,
                            ),),
                      ),),
              ],
            ),
          ),
          quarterTurns: 45),
    );
  }
}
