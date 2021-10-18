import 'package:get/get.dart';
import 'package:trailer/controller/searchController.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<SearchController>(SearchController());
  }
}