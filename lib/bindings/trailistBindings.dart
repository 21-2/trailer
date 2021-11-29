import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/controller/loginController.dart';
import 'package:trailer/controller/trailistController.dart';

class TrailistBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<LoginController>(LoginController());
    Get.put<HomeController>(HomeController());
    Get.put<TrailistController>(TrailistController());
  }
}