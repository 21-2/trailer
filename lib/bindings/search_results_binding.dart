import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/controller/searchController.dart';

class SearchResultsBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<SearchController>(SearchController());
    Get.put<HomeController>(HomeController());
  }
}