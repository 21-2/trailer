import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trailer/model/Locations.dart';
import 'package:trailer/model/User.dart';

class TrailistController extends GetxController{

  late UserModel userModel;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<dynamic> locationList = [];
  List<dynamic> geolocationList = [];
  List<Locations> locations = [];


  late User _user;
  User get user => _user;

  late String documentId = "";
  late String currentTrailistName = "";

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

   Future<void> updateName(String newName) async{
    CollectionReference trailist = FirebaseFirestore.instance.collection('Trailist');
    await trailist
        .doc(documentId)
        .update({'trailistName': newName})
        .then((value) => print("trailist name Updated"))
        .catchError((error) => print("Failed to update user: $error"));
   }

   Future<void> addTrailer(String newTrailier) async {
     CollectionReference trailist = FirebaseFirestore.instance.collection('Trailist');
     CollectionReference user = FirebaseFirestore.instance.collection('Users');

     DocumentReference docRef = await user.add(
         {"name": "아무개", "email": newTrailier, "recentSearch" : [], "favorites": [], "cart" : [] , "trailist" : []}
     );

      await trailist
         .doc(documentId)
         .update({'participants': FieldValue.arrayUnion([docRef.id])})
         .then((value) => print("trailer added"))
         .catchError((error) => print("Failed to add trailer: $error"));

   }

  Future<void> deleteTrailer(String trailier) async {
    CollectionReference trailist = FirebaseFirestore.instance.collection('Trailist');
    await trailist
        .doc(documentId)
        .update({'participants': FieldValue.arrayRemove([trailier])})
        .then((value) => print("trailer deleted"))
        .catchError((error) => print("Failed to add trailer: $error"));
  }

  Future<void> getGeolocation() async {
    locations = [];

    for (int i = 0; i < locationList.length; i++) {
      String locationID = locationList[i]['locationId'];

      FirebaseFirestore.instance
          .collection('Location')
          .doc(locationID)
          .get()
          .then((doc) {
        if (doc.exists) {
          print(doc['locationName']);
          Locations tempLocation = Locations.fromSnapshot(doc);
          locations.add(tempLocation);
          //locations.add(documentSnapshot.dat);
        }
      });
    }
  }
}