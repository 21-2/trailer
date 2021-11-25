import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/model/User.dart';
import 'package:trailer/widget/trailist.dart';

class SearchController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late UserModel userModel;

  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User? _user = firebaseAuth.currentUser;

  //Map<String, String> likeList = {};
  //Map<String, Location> trailist = {};

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


  /*void setTrailist() async {
    await firestore
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
  }*/

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
          TrailistCard(),
          //TrailistCard(),
        ],
      );
  }
}
