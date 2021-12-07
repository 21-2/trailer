import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/searchController.dart';
import 'package:trailer/views/searchResults.dart';

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
                padding: const EdgeInsets.fromLTRB(8.0, 50, 8,0),    //R:8
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.05,
                  child: TextField(
                    autofocus: true,
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    controller: _searchBar,
                    onChanged: (text){
                      //이제 _searchBar.text로 변수 값 사용할 수 있게 됨.
                    },
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
              IconButton(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                onPressed: () {
                  controller.setSearchResult(_searchBar.text);
                  controller.addRecentSearch(_searchBar.text);
                  if(controller.searchLocationList != null)
                    Get.to(SearchResults());
                },
                icon: Icon(Icons.send, color: Color.fromRGBO(189, 189, 189, 100)),
                iconSize: 30.0,
              ),
            ],
          ),
          Expanded(child: 
            ListView.builder(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
              itemCount: 1,
              itemBuilder: (context, index){
              return
                Container(
                  height: height,
                  color: Colors.transparent,
                  child: ListView(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i=0; i< controller.homeController.userModel.recentSearch!.length; i++)
                              Row(children:[
                                Icon(Icons.north_west,color: Colors.grey, size: 18),
                                SizedBox(width: 15),
                                Text(controller.homeController.userModel.recentSearch![i], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                                SizedBox(height: 5),
                                Divider(thickness: 1, height: 5, color: Colors.grey.shade300, indent: 30, endIndent: 30)
                              ],),
                        ],
                        ),
                      ),
                  ],
                  ),
                    /*Column(
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
                    )*/
                );
              }
            ))
        ],
      ));
  }
}
