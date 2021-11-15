import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/dashboardController.dart';
import 'package:trailer/views/aiTrailer.dart';
import 'package:trailer/views/favorites.dart';
import 'package:trailer/views/home.dart';
import 'package:trailer/views/profile.dart';

class DashboardPage extends StatelessWidget {
var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  final controller = Get.find<DashboardController>();
  Widget build(BuildContext context) {
    return 
    GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                AiTrailer(),
                HomeView(),
                Favorites(),
                ProfileView(),
              ],
            )
          ),
        bottomNavigationBar: BottomNavigationBar(
          items:   const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.photo_camera),
                label: "AI"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorite"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"
              ),
          ],
          currentIndex: controller.tabIndex,
          selectedItemColor: Color(0xffFE4D68),
          onTap: controller.changeTabIndex,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 1,
          iconSize: 27,
          type: BottomNavigationBarType.fixed,
          ),
      );
      }
    );
  }
}