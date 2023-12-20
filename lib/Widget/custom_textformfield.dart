import 'package:flutter/material.dart';

class Custom_TextField extends StatelessWidget {
 TextEditingController ?value= TextEditingController();
 // GlobalKey<FormState>key=GlobalKey<FormState>();
  int ?index;
  // int index;

  Custom_TextField({@required this.index,
    @required this.value,
 //   @required this.key,
    required this.vali
  });
  VoidCallback (){}

  final String? Function(String?) vali;
  String? myvalidat(text){
    print(text);
    if(text!.isEmpty){
      return 'Enter any Text';
    }
    else
      return null;
  }
  @override
  Widget build(BuildContext context) {
    print(index);
    return Container(
      //  height: 40,
      child: TextFormField(
      validator: vali,
      maxLines: 5,
      minLines: 1,
       controller: value,
      textInputAction: index==1?TextInputAction.done:TextInputAction.newline,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:  index==1?25:20,
      ),
      //  initialValue: '',
        onChanged: (v){
       //   key.currentState!.validate();
        },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        icon: InkWell(
            child: Icon(Icons.library_add,)),
        hintText: 'Title Name',
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
            color: Colors.green ,
            width: 2),),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1,color: Colors.green ,)),
        disabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(width: 1,color: Colors.green ,)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3,
              color: Colors.red),
        ),
      ),
      ),
    );
  }
}
