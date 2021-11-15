import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/model/User.dart';

class FavoritesController extends GetxController{

  HomeController homeController = Get.find<HomeController>(); 
  late UserModel userModel;


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