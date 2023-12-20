import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/step.dart';



Step CustomStep(int ?index, String ?title, String ?subtitle,Widget contant){
  CustomSteper ctx=Get.put(CustomSteper());
  return Step(


      title: Text('$title'),
      state: ctx.count>index!?StepState.complete:StepState.indexed,
      isActive: ctx.count==index?true:false,
      subtitle: Text('$subtitle'),
      content: contant);
}