
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/controller/loginController.dart';
import 'package:trailer/model/Locations.dart';
import 'package:trailer/route/app_pages.dart';
import 'package:trailer/model/User.dart';

class HomeController extends GetxController{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late GoogleSignIn googleSign;
  var _isSignIn = false.obs;
  get isSignIn => _isSignIn;


  late UserModel userModel;
  late User _user;
  User get user => _user;

  List<Location> locationList = [];
  Map<String, Location> locationMap ={};

  List<String> firstRowLocations = ["OqagRBhErUyfjqt3SaH7", "ShW5Odw0EkirlgifPAzP", "2qJnz6W3sbBkBkkb27xJ"];
  List<String> secondRowLocations = ["p13gnkhKpjfz34l6cLT0", "NJMR1STvTN1TbFbEQNVf", "IsmOHmhroY4uSVuiVDqA"];
  List<String> firstRowTrailers = ["R3nTf12LPo5pZrmNqg7t", "AEotD60el35tWOaPTdhv"];

  @override 
  void onInit() async{
    super.onInit();
    LoginController loginController = Get.find<LoginController>();
    userModel = loginController.userModel;
    await setLocations();
  }

  @override
  void onReady() async{
    googleSign = GoogleSignIn();
    ever(_isSignIn, handleAuthStateChanged);
    _isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event){
      _isSignIn.value = event != null;
    });
    super.onReady();
  }

  @override 
  void onClose(){
  }

  void handleAuthStateChanged(isLoggedIn){
    if (isLoggedIn){
      _user = firebaseAuth.currentUser!;
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> signOut() async {
   await FirebaseAuth.instance.signOut();
   googleSign.signOut();
  }

 Future<void>? setLocations() async{
   await firestore.collection('Location').get().then((QuerySnapshot snapshot){
     snapshot.docs.forEach((doc){
       Location tempLocation = Location.fromSnapshot(doc);
       locationList.add(tempLocation);
       locationMap.addAll({tempLocation.locationId! : tempLocation});
     });
   });
 }

 void printLocation(){
   print(locationList);
 }
Future<void>? setTrailist() async{
      
}
}