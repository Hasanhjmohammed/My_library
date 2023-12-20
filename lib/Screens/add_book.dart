import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mylib/Widget/custom_drawer.dart';
import 'package:page_transition/page_transition.dart';
import '../Controller/author.dart';
import '../Controller/image.dart';
import '../Controller/step.dart';
import '../DataBase/sqf_db.dart';
import '../Function/add_image.dart';
import '../Function/animation_dialg.dart';
import '../Widget/custom_step.dart';
import '../Widget/custom_textformfield.dart';
import '../Widget/custom_textstely.dart';
import '../Widget/cutom_dropdown.dart';
import 'main_book.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController title=TextEditingController();
  TextEditingController subtitle=TextEditingController();
  String ?path;
  int i=0;
  MySql mySql = MySql();
  Author author = Get.put(Author());
  CustomSteper ctx = Get.put(CustomSteper());
  CustomPicker ctxx = Get.put(CustomPicker());
  GlobalKey<FormState> key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Add Book',
          style: CustomTextStely(),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<CustomSteper>(
        builder: (_) => Form(
          key: key,
          child: Stepper(
            currentStep: ctx.count,
            elevation: 0.2,
             onStepTapped: (index) {
              if(index<ctx.count){
                ctx.ch(index);
              }
             },
            onStepCancel: () {
              ctx.decrement(context);
            },
            type: StepperType.vertical,
            onStepContinue: () {
              i++;
                    print(ctx.count);
              // if(ctx.count==1)
              //   ctx.increment(context);
              // if(ctx.count==2)
              //   ctx.increment(context);
              if(ctx.count==3)
              {
                buildShowGeneralDialog(context,Container(

                  child:  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Are you want Add this book?'),
                    ),
                    subtitle: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //  backgroundColor: Colors.red
                      ),
                      onPressed: ()async{
                        int i=  await mySql.adddatabase('''INSERT INTO Book
                (title,subtitle,path,author,date)
                VALUES("${title.text}","${subtitle.text}","${ctxx.myimage!.path}","${author.value.toString()}",
                "${DateFormat.yMd().format(DateTime.now())}")''');
                        print(i);
                        Navigator.of(context).pushAndRemoveUntil(PageTransition(
                          type: PageTransitionType.topToBottom,
                          child: Ex(),
                        ), (route) => false);

                        ctx.ch(0);
                        ctxx.myimage = null;
                      },
                      child: Icon(Icons.thumb_up),

                    ),
                  ),));
              }

              if(key.currentState!.validate()&& ctx.count < 3)
              { ctx.increment(context);
              print(ctx.count);
              }

            //  print(key.currentState!.validate());

            },
            steps: <Step>[
              CustomStep(
                0,
                'Title Book',
                '',
                Custom_TextField(
                  index: 1,
                  value: title,
                  vali: (String? text) {
                    print(text);
                    if (text!.isEmpty) {
                      return 'Enter any Text';
                    } else
                      return null;
                  },
                ),
              ),
              CustomStep(
                1,
                'SubTitle Book',
                'details Book',
             //   Container()
                Custom_TextField(
                  value: subtitle,
                  index: 2,
                  vali: (String? text) {
                    // print(text);
                    // if (text!.isEmpty) {
                    //   return 'Enter any Text';
                    // } else
                     // return null;
                  },
                ),
              ),
              CustomStep(
                2,
                'Image book Book ',
                'Gallery only',
                GetBuilder<CustomPicker>(
                  builder: (_) => Stack(
                    children: [
                      ctxx.myimage != null
                          ? Container(
                              child: ctxx.myimage!.path == null
                                  ? Image.asset('images/img_2.png')
                                  : Image.file(
                                      File(ctxx.myimage!.path),
                                      height: 200,
                                      width: 200,
                                    ))
                          : Container(
                              child: Image.asset(
                                'images/img_2.png',
                                width: 400,
                                height: 200,
                              ),
                            ),
                      Positioned(
                        bottom: ctxx.myimage == null ? 28.0 : 0.0,
                        right: ctxx.myimage == null ? 80.0 : 0.0,
                        child: CircleAvatar(
                          radius: ctxx.myimage == null ? 30 : 20,
                          child: IconButton(
                            icon: Icon(
                                ctxx.myimage == null ? Icons.add : Icons.edit),
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomStep(
                3,
                'author Book ',
                'Writer',
                  CustomDropDown()
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()async{
      //
      //     print(await mySql.readdatabase('SELECT * FROM book'));
      //
      //   // int i=  await mySql.adddatabase('''INSERT INTO Book
      //   // (title,subtitle,path,aother)
      //   // VALUES("${title.text}","${subtitle.text}","${ctxx.myimage!.path}","${athore.value.toString()}")''');
      //   // print(i);
      //   }
      // ),
    );
  }
}
