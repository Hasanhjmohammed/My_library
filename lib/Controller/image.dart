

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomPicker extends GetxController {
  XFile ?myimage;

  void changeimage(XFile image){

    myimage=image;
    update();
  }

}