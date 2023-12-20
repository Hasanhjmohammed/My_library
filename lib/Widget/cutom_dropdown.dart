import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/author.dart';


class CustomDropDown extends StatelessWidget {
  Author author = Get.put(Author());
  String dropdownValue = 'Book';
  List<String> list1 = <String>['Add Athore', 'Book', 'Novel', 'Story', 'Note'];

  @override
  Widget build(BuildContext context) {

    return GetBuilder<Author>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: DropdownButton<String>(
            style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            //  isExpanded: true,
            underline: Container(),
            value: dropdownValue,
            icon: Icon(
              Icons.menu,
              size: 35,
            ),
            onChanged: (myvalue) {
              dropdownValue = myvalue!;
              author.sel(myvalue);
              author.change(list1.indexOf(myvalue));
            },
            items:
            list1.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: value == list1[0]
                      ? InkWell(
                    onTap: () => print('hello hasan'),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20.0),
                      ),
                      elevation: 7,
                      color: Colors.white,
                      child: Container(
                        //   height: 100,
                        //    margin:  EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                value,
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.add_circle_outline)
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(20),
                            color:  Colors.black12.withOpacity(0.1),
                          ),
                      ),
                    ),
                  )
                      : Text( value,
                    style: TextStyle(
                        fontWeight: FontWeight.normal),
                  ));
                     }).toList(),
          ),
        );
      }
    );
  }
}
