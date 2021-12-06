import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/model/User.dart';
import 'package:trailer/widget/myLocationCard.dart';
import 'package:trailer/widget/myTrailist.dart';

class FavoritesController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late UserModel userModel;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User? _user = firebaseAuth.currentUser;

  static List<Widget> list = [];
  static List<String> idList = [];

  static List<Widget> trailist = [];

  @override
  void onInit() async {
    super.onInit();
    trailist = [];
    setLocations();
    setTrailists();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  static Future<void> setLocations() async {
    idList = [];

    await firestore
        .collection('Users')
        .doc(_user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        List.from(documentSnapshot['favorites']).forEach((locationId) {
          if (!idList.contains(locationId)) {
            idList.add(locationId);
          }
        });
      }
    });
  }

  static Widget setLocationCard() {
    list = [];
    for (int i = 0; i < idList.length; i+=3) {
        List<Widget> temp = [];

        for(int j=i; j<i+3; j++){
          if(j < idList.length)
            temp.add(MyLocationCard(documentID: idList[j]));
        }

        list.add(
            Row( children: temp));
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list
    );
  }

  static Future<void> setTrailists() async {
    trailist = [];
    await firestore
        .collection('Trailist')
        .where('participants', arrayContainsAny: [_user!.uid])
        .get()
        .then((QuerySnapshot snapshot) {
          snapshot.docs.forEach((doc) {
            print(doc.id);
            trailist.add(MyTrailistCard(documentID: doc.id));
          });
        });
  }

  Future<void> deleteMember() async {}
}
