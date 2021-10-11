import 'package:get/get.dart';
import 'package:trailer/controller/loginController.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<LoginController>(LoginController());
  }
}