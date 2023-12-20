
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Controller/image.dart';


Future getImage(ImageSource imageSource) async {
  CustomPicker _cutompicker=Get.put(CustomPicker());
  final ImagePicker _picker = ImagePicker();
  XFile ?_Image;
  XFile? image = await _picker.pickImage(source: imageSource);
  if (image == null) return;
  XFile myimage = XFile(image.path);
  _cutompicker.changeimage(myimage);
}