import 'package:get/get.dart';
import 'package:trailer/controller/aiController.dart';
import 'package:trailer/controller/favoritesController.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/controller/loginController.dart';

class DashboardController extends GetxController{
  HomeController homeController = Get.find<HomeController>(); 
  LoginController loginController = Get.find<LoginController>();
  FavoritesController favoritesController = Get.find<FavoritesController>();
  AiController aiController = Get.find<AiController>();
  var tabIndex = 1;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
  @override 
  void onInit() async{
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override 
  void onClose(){
  }

}