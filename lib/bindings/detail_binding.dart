import 'package:get/get.dart';
import 'package:trailer/controller/detailController.dart';

class DetailBinding extends Bindings{ 
  @override 
  void dependencies(){
    Get.put<DetailController>(DetailController());
  }
}