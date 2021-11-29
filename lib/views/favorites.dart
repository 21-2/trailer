import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/favoritesController.dart';


class Favorites extends GetView<FavoritesController> {
  final _searchBar = TextEditingController();
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.15),
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
                  Tab(text: "찜 리스트"),
                  Tab(text: "내 트레일리스트"),
                ],
              ),
              actions: [
                IconButton(
                  iconSize: 30.0,
                  color: Color.fromRGBO(254, 113, 117, 100),
                  icon: ImageIcon(AssetImage('lib/images/shoppingCart.png')),
                  onPressed: () {},
                )
              ],
              title: Image(
                  image: AssetImage('lib/images/trailer_text.png'),
                  width: width * 0.3),
              centerTitle: true,
            ),
          ),
          body: TabBarView(
            children: [
              firstTab(),
              secondTab(),
            ],
          ),
        ));
  }
}

Widget firstTab() {
  return FutureBuilder(
   future: FavoritesController.setLocations(),
    builder: (context, snapshot) {
       if(snapshot.connectionState == ConnectionState.waiting) 
         return 
         Container(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               CircularProgressIndicator(
                 backgroundColor: Color.fromRGBO(232, 232, 232, 1),
               ),
             ],
           ),
         );     
      return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: FavoritesController.setLocationCard(),
            ),
          );
    }
  );
}

Widget secondTab() {
  return FutureBuilder(
    future: FavoritesController.setTrailists(),
    builder: (context, snapshot) {
      return SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: FavoritesController.setTrailistCard(),
      ));
    }
  );
}
