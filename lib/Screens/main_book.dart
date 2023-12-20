import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mylib/Controller/updatetext.dart';
import 'package:mylib/DataBase/sqf_db.dart';
import 'package:mylib/Screens/add_book.dart';
import 'package:mylib/Widget/book_mview.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mylib/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/book_view.dart';
import '../Widget/custom_drawer.dart';

class Ex extends StatefulWidget {
  const Ex({super.key});

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  MySql db_book=MySql();
  UpdataText up=Get.put(UpdataText());
var prefs =  SharedPreferences.getInstance();
  DateTime dateTime=DateTime.now();
 late List <Map<String ,Object ?>>res=[];
  Future <List <Map<String ,Object ?>>>data()async{
 res = await db_book.readdatabase('SELECT * FROM book');
 print(res);
  return res ;
    }


  @override
  void initState() {
      myShared.setBool('check', true);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer:CustomDrawer(),
      appBar: AppBar(
        title: Text('My Library',style: TextStyle(),
        )
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child:  RotatedBox(
                      quarterTurns: -45,
                      child : ListWheelScrollView(
                       itemExtent: 200,
                       diameterRatio: 2,
                      children: [
                          BookView(index: 1000,
                          title: 'أرض زيكولا ',path:'images/زيكولا.jpg',
                          subtitle: 'أرض زيكولا هي رواية خيالية تتعامل بواحدات الذكاء في نهاية كل عام يشنق الشخص الذي يمتلك وحدات أقل',
                          aother: 'عمر عبد الحميد',
                         // date:'${ DateFormat.yMd(DateTime.now()).toString()}'
                                  date:'${dateTime.year} / ${dateTime.month} / ${dateTime.day}',
                        ),
                          BookView(index: 1001,
                          title: 'قواهد جارتين',path:'images/قواعد جاريتن.jpg',
                          subtitle: 'هي رواية تتكلم عن عالم افتراضي يموت الشخص بمجرد وصله الى عمر ال50 عام '
                              'رواية جميلة جدا عن الحياة والموت',
                          aother: 'عمر عبد الحميد',
                          // date:'${ DateFormat.yMd(DateTime.now()).toString()}'
                          date:'${dateTime.year} / ${dateTime.month} / ${dateTime.day}',
                        ),
                          BookView(index: 1003,
                          title: 'شيفرة دافنشي ',path:'images/شيفرة دافنشي.jpg',
                          subtitle: 'رواية تتكلم عن شخص قتل في متحف في فرنسا والسبب في قتله لهذا الشخص كان باعجوبة ',
                          aother: 'دان برون',
                          // date:'${ DateFormat.yMd(DateTime.now()).toString()}'
                          date:'${dateTime.year} / ${dateTime.month} / ${dateTime.day}',
                        ),
                          BookView(index: 1004,
                           title: 'صلاة العارفين ',path:'images/img_3.png',
                         subtitle: 'هو كتاب يتحدث عن أسرار الصلاة للإمام الخميني  ',
                         aother: 'الإمام الخميني',
                           date:'${dateTime.year} / ${dateTime.month} / ${dateTime.day}',

                    ),
                          BookView(index: 1005,
                           title: 'عداء الطائرة الورقية',path:'images/img_6.png',
                           subtitle: 'رواية تتكلم عن الصداقة والخيانة ',
                           aother: ' خالد حسني ',
                           date:'${dateTime.year} / ${dateTime.month} / ${dateTime.day}',
                  ),
                        BookView(index: 1006,
                          title: ' أنا والكتاب ',path:'images/img_5.png',
                          subtitle: 'شرح عناوين كتب منوعة   ',
                          aother: ' الإمام الخامنائي ',
                          date:'${dateTime.year} / ${dateTime.month} / ${dateTime.day}',
                        ),
                        BookView(index: 1006,
                          title: ' الأربعون حديثا ',path:'images/img_4.png',
                          subtitle: 'شرح أحاديث عن مروية عن النبي الأكرم محمد   ',
                          aother: ' الإمام الخميني ',
                          date:'${dateTime.year} / ${dateTime.month} / ${dateTime.day}',
                        ),
                      ],
                      //clipToSize: true
                  )
                )),),
            Expanded(
                flex: 2,
                child: Container(
                  child:
                 FutureBuilder<List <Map<String ,Object ?>>>(
                   future:data(),
                   builder: (cont,snap){
                     return  snap.hasData?
                     snap.data!.isEmpty ?const Center(child: Text('Not Book Yet',
                    style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green),
                     ),):AnimationLimiter(
                       child: ListView.builder(
                           itemCount:res.length,
                           itemBuilder: (con,index){
                         return AnimationConfiguration.staggeredList(
                           position: index,
                           duration: const Duration(milliseconds: 500),
                           child: FlipAnimation(
                          //   verticalOffset: 100.0,
                             child: BooKMView(index: int.parse(snap.data![index]['id'].toString()),
                               title:snap.data![index]['title'].toString(),
                               path: snap.data![index]['path'].toString(),
                               subtitle:snap.data![index]['subtitle'].toString(),
                               aother: snap.data![index]['author'].toString(),
                               date: snap.data![index]['date'].toString(),
                             ),
                           ),
                         );
                           }
                       ),
                     ):const Center(child:CircularProgressIndicator(),);
                   }


                 ),
                )
      ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Book'),
        icon: Icon(Icons.add_box),
        onPressed: ()=> Navigator.of(context).push( PageTransition(
          type: PageTransitionType.bottomToTop,
          child: AddBook(),
        ),),
      ),
    );
  }
}
