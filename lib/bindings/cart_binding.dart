import 'package:get/get.dart';
import 'package:trailer/controller/detailController.dart';
import 'package:trailer/controller/homeController.dart';
class CartBinding extends Bindings{ 
  @override 
  void dependencies(){
    Get.put<HomeController>(HomeController());
    Get.put<DetailController>(DetailController());

  }
}