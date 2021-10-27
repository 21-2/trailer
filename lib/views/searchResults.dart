import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/searchController.dart';

class SearchResults extends GetView<SearchController> {
    final _searchBar = TextEditingController();
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: Color.fromRGBO(251, 124, 113, 100),),
        flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 50, 8,0),
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.05,
                  child: TextField(
                    autofocus: true,
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    controller: _searchBar,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(232, 232, 232, 100), width: 2),
                          borderRadius: BorderRadius.circular(30.0)),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 100),
                      labelText: '검색어를 입력해주세요',
                      prefixIcon:
                          Icon(Icons.search, color: Color.fromRGBO(189, 189, 189, 100)),
                      labelStyle: TextStyle(
                          fontSize: 12, color: Color.fromRGBO(189, 189, 189, 100)),
                    ),
                  ),
                ),
              ),
            actions: [
              IconButton(
                    color: Color.fromRGBO(254, 113, 117, 100),
                    icon: ImageIcon(AssetImage('lib/images/shoppingCart.png')),
                    onPressed: () {},
                  )
            ],
      ),
    );
  }
}