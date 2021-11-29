
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailer/controller/loginController.dart';
import 'package:trailer/model/Locations.dart';
import 'package:trailer/model/Trailist.dart';
import 'package:trailer/route/app_pages.dart';
import 'package:trailer/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class HomeController extends GetxController{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late GoogleSignIn googleSign;
  var _isSignIn = false.obs;
  get isSignIn => _isSignIn;
  var location = new Location();
  var currentLocation;


  late UserModel _userModel;
  UserModel get userModel => _userModel;
  late User _user;
  User get user => _user;

  List<Locations> locationList = [];
  RxList<Trailist> trailistList = <Trailist>[].obs;

  List<String> firstRowLocations = ["OqagRBhErUyfjqt3SaH7", "ShW5Odw0EkirlgifPAzP", "2qJnz6W3sbBkBkkb27xJ"];
  List<String> secondRowLocations = ["p13gnkhKpjfz34l6cLT0", "NJMR1STvTN1TbFbEQNVf", "IsmOHmhroY4uSVuiVDqA"];
  List<Trailist> firstRowTrailers = [];

  @override 
  void onInit() async{
    googleSign = GoogleSignIn();
    ever(_isSignIn, handleAuthStateChanged);
    _isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event){
      _isSignIn.value = event != null;
    });
    super.onInit();
  }

  @override
  void onReady() async{
    super.onReady();
  }

  @override 
  void onClose(){
  }

  void handleAuthStateChanged(isLoggedIn) async{
    if (isLoggedIn){
      _user = firebaseAuth.currentUser!;
      _userModel = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
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
       Locations tempLocation = Locations.fromSnapshot(doc);
       locationList.add(tempLocation);
     });
   });

   await firestore.collection('Trailist').get().then((QuerySnapshot snapshot){
     snapshot.docs.forEach((doc){
      Trailist tempTrailist = Trailist.fromSnapshot(doc);
      if (tempTrailist.trailistId == "R3nTf12LPo5pZrmNqg7t" || tempTrailist.trailistId == "AEotD60el35tWOaPTdhv")
       trailistList.add(tempTrailist);
     });
   });
  update();
 }

 void enableLocation() async{
   var serviceEnabled = await location.serviceEnabled();
   if (!serviceEnabled){
     serviceEnabled = await location.requestService();
     if (!serviceEnabled) return;
   }
   var _permissionGranted = await location.hasPermission();
   if (_permissionGranted == PermissionStatus.denied){
     _permissionGranted = await location.requestPermission();
     if(_permissionGranted != PermissionStatus.granted) return;
   }
 }

 Future<String> trailistImage(Trailist trailist) async{


   Locations tempLocation = await FirebaseFirestore.instance
        .collection('Location')
        .doc(trailist.locations![0]["locationId"])
        .get()
        .then((doc) => Locations.fromSnapshot(doc));
  return tempLocation.img!;
 }

 void getWeather(String city) async{
    final queryParameters = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };

 }
}