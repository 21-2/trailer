 
 import 'package:get/get.dart';
import 'package:trailer/controller/aiController.dart';
import 'package:trailer/controller/dashboardController.dart';
import 'package:trailer/controller/detailController.dart';
import 'package:trailer/controller/favoritesController.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/controller/loginController.dart';
import 'package:trailer/controller/searchController.dart';

 class DashboardBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<HomeController>(HomeController());
    Get.put<LoginController>(LoginController());
    Get.put<SearchController>(SearchController());
    Get.put<AiController>(AiController());
    Get.put<FavoritesController>(FavoritesController());
    Get.put<DetailController>(DetailController());
    Get.put<DashboardController>(DashboardController());
  }
 }