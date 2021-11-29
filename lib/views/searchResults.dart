import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/searchController.dart';
import 'package:trailer/widget/myTrailist.dart';
import 'package:trailer/widget/searchlocationCard.dart';
import 'package:trailer/widget/trailist.dart';

class SearchResults extends GetView<SearchController> {
  final _searchBar = TextEditingController();
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: 
          PreferredSize(
            preferredSize: Size.fromHeight(height*0.15),
            child: AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                labelColor: Color.fromRGBO(73, 73, 73, 100),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Color.fromRGBO(189, 189, 189, 100),
                indicatorWeight: 3.0,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color.fromRGBO(73, 73, 73, 100),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 20)),
                tabs: [
                  Tab(text: "장소"),
                  Tab(text: "트레일리스트"),
                ],
              ),
              leading: 
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 30, 8, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left_outlined,
                          color: Color.fromRGBO(251, 124, 113, 100)),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: width * 0.7,
                      child: TextField(
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        controller: _searchBar,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(232, 232, 232, 100),
                                  width: 2),
                              borderRadius: BorderRadius.circular(30.0)),
                          filled: true,
                          fillColor: Color.fromRGBO(246, 246, 246, 100),
                          labelText: '검색어를 입력해주세요',
                          prefixIcon: Icon(Icons.search,
                              color: Color.fromRGBO(189, 189, 189, 100)),
                          labelStyle: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(189, 189, 189, 100)),
                        ),
                      ),
                    ),
                    Container(
                        width: width * 0.2,
                        child: IconButton(
                          iconSize: 30.0,
                          color: Color.fromRGBO(254, 113, 117, 100),
                          icon:
                              ImageIcon(AssetImage('lib/images/shoppingCart.png')),
                          onPressed: () {},
                        ))
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              firstTab(),
              secondTab(),
            ],
          ),
      )
    );
  }
}

Widget firstTab(){
  return 
  SingleChildScrollView(
    child: 
    Padding(
      padding: const EdgeInsets.fromLTRB(15,30,15,0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchLocationCard(),
              SearchLocationCard(),
              SearchLocationCard(),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget secondTab(){
  return SingleChildScrollView(
    child:
    Padding(
      padding: const EdgeInsets.fromLTRB(15,30,15,0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TrailistCard(),
              TrailistCard(),
              TrailistCard(),
            ],
          ),
        ],
      ),
    ),
  );
}