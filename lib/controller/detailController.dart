import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/model/Locations.dart';

class DetailController extends GetxController{

  late Locations currentLocation;
  String documentId = "";
  RxBool favorited = false.obs;
  RxInt count = 0.obs;
  List<String> firstRowLocations = ["OqagRBhErUyfjqt3SaH7", "ShW5Odw0EkirlgifPAzP", "2qJnz6W3sbBkBkkb27xJ"];
  List<String> reviewUsers = [];
  var firebase = FirebaseFirestore.instance;
  HomeController homeController = Get.find<HomeController>();
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

    void pressedFavorited() async{
      if (favorited.isFalse) {
        count--;
        homeController.userModel.favorites!.remove(documentId);
      }
      else {
        count ++;
        homeController.userModel.favorites!.add(documentId);
      }
       await firebase.collection("Location").doc(documentId).update({
        "likes" : count.value,
      });
        await firebase.collection("Users").doc(homeController.user.uid).update({
        "favorites" : homeController.userModel.favorites,
      });

    }

    addReview(String newReview) async{ 
      currentLocation.reviews!.add({
        "date" : Timestamp.fromDate(DateTime.now()),
        "review" : newReview,
        "userid" : homeController.user.uid,
      });

      await firebase.collection("Location").doc(documentId).update({
        "reviews" : currentLocation.reviews
      });
    }

    Future<void>?setLocation() async{
   
        currentLocation = await firebase
        .collection('Location')
        .doc(documentId)
        .get()
        .then((doc) => Locations.fromSnapshot(doc));

        count.value = currentLocation.likes!;
       CollectionReference userCollection = await firebase.collection("Users");
       for (int i=0; i<currentLocation.reviews!.length; i++){
        await userCollection.doc(currentLocation.reviews![i]["userid"]).get().then((snapshot){
          reviewUsers.add(snapshot["name"]);
        });
       }
      
        for (int i=0; i< homeController.userModel.favorites!.length; i++){
          if (documentId == homeController.userModel.favorites![i]){
            favorited.value = true;
          }
        }



  }
  

}