import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/controller/loginController.dart';
import 'package:trailer/controller/searchController.dart';

class MainBinding extends Bindings{ 
  @override 
  void dependencies(){
    Get.put<LoginController>(LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
  }
}