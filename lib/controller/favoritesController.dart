import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/model/User.dart';

class FavoritesController extends GetxController{

  HomeController homeController = Get.find<HomeController>(); 
  late UserModel userModel;
  //String uid = homeController.firebaseAuth.currentUser!.uid;
  Stream _myLocationStream = FirebaseFirestore.instance.collection('Users').doc('hello').snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  // users collection에서 현재 firebaseUser.uid인 user만 가져와서 이를 data에 옮김
  //QuerySnapshot data = await users.where('uid', isEqualTo: uid).get();

  @override 
  void onInit() async{
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override 
  void onClose(){
  }

  void getAllLocationlist(){

  }

}