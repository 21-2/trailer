
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/views/home.dart';

class LoginController extends GetxController{
  HomeController homeController = Get.find<HomeController>(); 
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

  void login() async{
    GoogleSignInAccount? googleSignInAccount = await homeController.googleSign.signIn();
    if (googleSignInAccount == null) {
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await homeController.firebaseAuth.signInWithCredential(oAuthCredential);
    }
  }
}
