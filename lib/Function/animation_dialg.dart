import 'package:flutter/material.dart';


Future<Object?> buildShowGeneralDialog(BuildContext context,Widget contan) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              // title: ,
              // actions: [
              //
              // ],
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              //     title: Text('Hello!!'),
              content: contan,
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container(
          child: Text(''),
        );
      });
}