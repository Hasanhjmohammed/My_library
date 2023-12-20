import 'package:flutter/material.dart';
class ListTitleDrawer extends StatelessWidget {
  IconData ?myicon;
  String  ?title;

   ListTitleDrawer({required this.myicon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading:Icon(myicon),
        title: Text(title!),
      ),
    );
  }
}
