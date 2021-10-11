import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';

class HomeBinding extends Bindings{ 
  @override 
  void dependencies(){
    Get.put<HomeController>(HomeController());
  }
}