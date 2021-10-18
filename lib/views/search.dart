import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/searchController.dart';

class SearchView extends GetView<SearchController> {

  final _searchBar = TextEditingController();
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
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
              )
            ],
          ),
          Expanded(child: 
            ListView.builder(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
              itemCount: 3,
              itemBuilder: (context, index){
              return
                Container(
                  height:50,
                  color: Colors.transparent,
                  child: 
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.north_west,color: Colors.grey, size: 18),
                            SizedBox(width: 15),
                            Text("포항", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(thickness: 1, height: 5, color: Colors.grey.shade300, indent: 30, endIndent: 30)
                      ],
                    )
                );
              }
            ))
        ],
      ));
  }
}
