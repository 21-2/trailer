
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/controller/homeController.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trailer/model/User.dart';

class LoginController extends GetxController{

  HomeController homeController = Get.find<HomeController>(); 
  RxBool isLoggedIn = false.obs;
  bool sign() {
    return isLoggedIn.value;
  }
  late UserModel _userModel;
  UserModel get userModel => _userModel;
  set userModel (UserModel userModel) {
    _userModel = userModel;
  }

  late User user;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
      addUserToTrailer();
      _intializeUserModel(user.uid);
      isLoggedIn.value = true;
    }
  }

void addUserToTrailer() async{
    user = homeController.user;
    try{
      await firebaseFirestore.collection("Users").doc(user.uid).set(
        {"name": user.displayName, "id": user.uid, "email": user.email, }
      );
    } catch(e){
      print(e);
    }
  }

  _intializeUserModel(String uid) async{
    userModel = await firebaseFirestore
        .collection("Users")
        .doc(userModel.id)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }
}
