import 'package:flutter/material.dart';

import 'listtitledrawer.dart';

CustomDrawer (){

  return  Drawer(

    child:Column(
      children: [
        Container(
          width: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              DrawerHeader(
                  decoration:const  BoxDecoration(

                  ), child:   Align(
                alignment: Alignment.topLeft,
                child:  Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      radius: 50,

                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage:AssetImage('images/img.png',),
                      ),
                    ),
                  ),
                ),
              ),

                  ),
            Padding(padding: EdgeInsets.only( bottom: 20,left: 20),child:   Text('Hasan Jaffer Hj Mohammed',

              style: TextStyle(),),)
            //  Text('hasanjafferhjmohammed@gmail.com'),
            ],
          )
          ),
        // Container(height:250),
        Expanded(
          flex:3,

          child:   Container(
            child: Column(
              children: [
                ListTitleDrawer(myicon: Icons.notes_rounded, title: 'my Book'),
                ListTitleDrawer(myicon: Icons.add_box, title: 'Add Book'),
                ListTitleDrawer(myicon: Icons.star, title: 'my favort'),
                ListTitleDrawer(myicon: Icons.search, title: 'Search '),
                ListTitleDrawer(myicon: Icons.notification_add, title: 'Notification'),

              ],

            ),
          ),),
        Divider(

        ),
        Expanded(
          flex:1,
          child:   Container(
              child:Column(children: [
                ListTitleDrawer(myicon: Icons.person, title: 'profile'),
                ListTitleDrawer(myicon: Icons.settings, title: 'Setting'),



              ],),
          ),)

      ],
    ) ,
  );
}