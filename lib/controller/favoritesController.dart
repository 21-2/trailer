
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/model/Trailist.dart';
import 'package:trailer/model/User.dart';
import 'package:trailer/widget/myLocationCard.dart';
import 'package:trailer/widget/myTrailist.dart';
import 'package:trailer/widget/trailist.dart';

class FavoritesController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late UserModel userModel;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User? _user = firebaseAuth.currentUser;

  static List<Widget> list =[];
  static List<String> idList = [];

  static List<String> trailistId = ["7iplYii7Enx3JoiglCkf", "AEotD60el35tWOaPTdhv", "GURnZKqcRDzX4XofqsUN"];  //임시
  static List<Widget> trailist = [];
//선택된 트레일리스트 ID

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

  static Future<void> setLocations() async {
    print("set locations  시작!");
    list =[];
    idList = [];

    await firestore
        .collection('Users')
        .doc(_user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        List.from(documentSnapshot['favorites']).forEach((locationId){
          if(!idList.contains(locationId)){
            idList.add(locationId);
          }
        });
      }
    });
  }

  static Widget setLocationCard() {
    for(String item in idList){
      list.add(MyLocationCard(documentID: item));
    }

    return
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              MyLocationCard(documentID: idList[0]),
              MyLocationCard(documentID: idList[1]),
              MyLocationCard(documentID: idList[2]),
            ]
          )
        ],
      );
  }

  static Future<void> setTrailists() async {
    print("set trailists 시작!");
    //trailistId = [];
    await firestore
        .collection('Trailist')
        .where('participants', arrayContainsAny: [_user!.uid])
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        //print(doc.id);
        //trailistId.add(doc.id);
      });
    });
  }

  static Widget setTrailistCard() {
    print("set trailist card");

    for(String item in trailistId){
      trailist.add(MyLocationCard(documentID: item));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      [
        MyTrailistCard(documentID: trailistId[0]),
        MyTrailistCard(documentID: trailistId[1]),
        MyTrailistCard(documentID: trailistId[2]),
      ],
    );
  }

  Future<void> deleteMember() async {

  }



}
