import 'package:flutter/material.dart';

import '../Function/animation_dialg.dart';
import 'cutom_dropdown.dart';

class CustomCard extends StatelessWidget {
  String ?value;
  VoidCallback ?callback;
   CustomCard({@required this.value, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return  InkWell(

      child: Container(

         decoration: BoxDecoration(
           borderRadius: BorderRadius.only(topRight: Radius.circular(25),
           
           bottomLeft: Radius.circular(25)
           ),
           color: Colors.green.withOpacity(0.9),
           
         ),
          child: Padding(
            child:
            Text('$value'),
            padding: EdgeInsets.all(20),
          )),
    );
  }
}
