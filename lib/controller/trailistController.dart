import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trailer/model/User.dart';

class TrailistController extends GetxController{

  late UserModel userModel;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Map<String, String> likeList = {};
  //Map<String, Location> trailist = {};

  late User _user;
  User get user => _user;

  late String documentId = "";

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

  Future<void>? setTrailist() async{
    /*await firestore.collection('Trailist')
        .where('participants', arrayContainsAny: [_user.uid])
        .get().then((QuerySnapshot snapshot){
      snapshot.docs.forEach((doc){
        print('location!!');
        print(doc['locationName']);
          //trailist.addAll({tempLocation.locationId! : tempLocation});
      });
    });*/
  }

}