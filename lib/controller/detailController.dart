import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trailer/model/Locations.dart';
import 'package:trailer/model/User.dart';

class DetailController extends GetxController{

  late UserModel userModel;
  late Location currentLocation;
  String documentId = "";
  RxBool favorited = false.obs;
  List<String> firstRowLocations = ["OqagRBhErUyfjqt3SaH7", "ShW5Odw0EkirlgifPAzP", "2qJnz6W3sbBkBkkb27xJ"];
  List<String> reviewUsers = [];
  var firebase = FirebaseFirestore.instance;
  @override 
  void onInit() async{
   await setLocation();
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override 
  void onClose(){
  }

    Future<void>?setLocation() async{
   
        currentLocation = await firebase
        .collection('Location')
        .doc(documentId)
        .get()
        .then((doc) => Location.fromSnapshot(doc));

       CollectionReference userCollection = await firebase.collection("Users");
       for (int i=0; i<currentLocation.reviews!.length; i++){
        await userCollection.doc(currentLocation.reviews![i]["userid"]).get().then((snapshot){
          reviewUsers.add(snapshot["name"]);
        });

       }


  }
  

}