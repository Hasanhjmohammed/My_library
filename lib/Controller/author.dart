import 'package:get/get.dart';

class Author extends GetxController {
  int selectedIndex = 0;
  int cont=0;
  String value='Book';
  void change(int index)
  {


    selectedIndex = index;
    update();
    print(selectedIndex);
  }

  incre(){

    cont++;
    update();
  }
  sel(myvalue){
    value=myvalue;
    update();

  }

}
