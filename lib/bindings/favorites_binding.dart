import 'package:get/get.dart';
import 'package:trailer/controller/favoritesController.dart';

class FavoritesBinding extends Bindings{ 
  @override 
  void dependencies(){
    Get.put<FavoritesController>(FavoritesController());
  }
}