import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/homeController.dart';

class HomeView extends GetView<HomeController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  Widget build(BuildContext context){
    return Scaffold(
      body: Text("hello", style: TextStyle(color: Colors.black))
    );
  }

}