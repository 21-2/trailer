import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/aiController.dart';

class AiTrailer extends GetView<AiController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Column(
         children: [
           Text("Hello"),
         ],
       ),
    );
  }
}