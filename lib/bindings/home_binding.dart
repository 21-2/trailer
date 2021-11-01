import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/controller/loginController.dart';
class HomeBinding extends Bindings{ 
  @override 
  void dependencies(){
    Get.put<HomeController>(HomeController());
    Get.put<LoginController>(LoginController());
  }
}