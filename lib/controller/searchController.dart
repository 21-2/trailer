import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/model/User.dart';
import 'package:trailer/widget/trailist.dart';
import 'package:trailer/model/Locations.dart';
import 'package:trailer/model/Trailist.dart';

class SearchController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late UserModel userModel = UserModel();

  late User user;

  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User? _user = firebaseAuth.currentUser;
  List<String> searchResult = [];
  List<Locations> searchLocationList = [];
  List<Trailist> searchTrailistList = [];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //Location List에 있는 모든 Location 정보 불러와서 Search key와 대조하기.
  void setSearchLocationList(List<String> searchResult) async{
    for (int i=0; i<searchResult.length; i++){
      firestore
          .collection("Location")
          .where('tag', arrayContains: searchResult[i])
          .get().then((QuerySnapshot ds){
        ds.docs.forEach((doc){
          Locations tempLocation = Locations.fromSnapshot(doc);
          searchLocationList.add(tempLocation);
          searchLocationList.toSet();
          print(tempLocation.locationName);
          update();
        });
      });
    }
    //중복 제거
    searchLocationList.toSet();
    update();
  }

  //Location List에 있는 모든 Location 정보 불러와서 Search key와 대조하기.
  void setSearchTraillistList(List<String> searchResult) async{
    for (int i=0; i<searchResult.length; i++){
      firestore
          .collection("Trailist")
          .where('tag', arrayContains: searchResult[i])
          .get().then((QuerySnapshot ds){
        ds.docs.forEach((doc){
          Trailist tempTrailist = Trailist.fromSnapshot(doc);
          searchTrailistList.add(tempTrailist);
          searchTrailistList.toSet();
          print(tempTrailist.trailistName);
          update();
        });
      });
    }
    //중복 제거
    searchTrailistList.toSet();
    update();
  }

  void setSearchResult(String searchKeyword) async{
    //문자열 단어 단위로 분리하기
    searchResult = searchKeyword.split(' ');
    setSearchLocationList(searchResult);
    setSearchTraillistList(searchResult);
  }

  void addRecentSearch(String newSearch) async{
    homeController.userModel.recentSearch!.add(
        newSearch
    );

    await firestore
        .collection("Users")
        .doc(homeController.user.uid).update({
      "recentSearch" : homeController.userModel.recentSearch
    });
  }


/*
 static Widget setTrailistCard() {
   print("set trailist card here!!!");
   firestore
       .collection('Trailist')
       .where('participants', arrayContainsAny: [_user!.uid])
       .get()
       .then((QuerySnapshot snapshot) {
     snapshot.docs.forEach((doc) {
       print('location!!');
       print(doc['locationName']);
       //trailist.addAll({tempLocation.locationId! : tempLocation});
     });
   });
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TrailistCard(),
        ],
      );
  }*/
}
