import 'package:get/get.dart';
import 'package:trailer/controller/trailistController.dart';

class TrailistBinding extends Bindings{
  @override 
  void dependencies(){
    Get.put<TrailistController>(TrailistController());
  }
}