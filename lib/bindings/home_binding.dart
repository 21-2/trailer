import 'package:get/get.dart';
import 'package:trailer/controller/detailController.dart';
import 'package:trailer/controller/favoritesController.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/controller/loginController.dart';
import 'package:trailer/controller/trailistController.dart';
class HomeBinding extends Bindings{ 
  @override 
  void dependencies(){
    Get.put<HomeController>(HomeController());
    Get.put(LoginController());
    Get.put<DetailController>(DetailController());
    Get.put<TrailistController>(TrailistController());

  }
}