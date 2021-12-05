import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/model/Locations.dart';


class CartController extends GetxController {

  RxList<dynamic> cartItemsDocumentId=[].obs;
  List<Locations> cartItems= [];
  List<RxBool> itemChecked = [];
  List<Locations> checkedCartItems= [];
  RxMap<String, dynamic> chosenDates = <String,dynamic>{}.obs;
  HomeController homeController = Get.find<HomeController>();
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  DateTime start = DateTime.now(); 
  DateTime end = DateTime.now(); 
  RxString startString = "".obs;
  RxString endString = "".obs;

  RxList<dynamic> travelerId = [].obs;
  String trailistName = "";
  @override
    void onInit() async {
      checkedCartItems = [];
      await setCartItems();
      super.onInit();
    }

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
      checkedCartItems = [];
    }

  setCartItems() async{
    cartItemsDocumentId= [].obs;
    cartItems = [];
    itemChecked = [];
    cartItemsDocumentId.value = homeController.userModel.cart!;
    for (int i=0; i<cartItemsDocumentId.length; i++){
      Locations tempLocation = await firebase.collection("Location").doc(cartItemsDocumentId[i]).get().then((doc)=>Locations.fromSnapshot(doc));
     cartItems.add(tempLocation);
     itemChecked.add(false.obs);
   }
   update();
  }

  removeCartItems(int index) async{
    homeController.userModel.cart!.removeAt(index);
    cartItemsDocumentId.value = homeController.userModel.cart!;
    firebase.collection("Users").doc(homeController.userModel.id).update(
      {"cart" : cartItemsDocumentId}
    );
    update();
  }

  setChosenItems(){
    for (int i=0; i< itemChecked.length; i++){
      if (itemChecked[i].value){
        
        checkedCartItems.add(cartItems[i]);
        chosenDates[cartItems[i].locationId!]= start;
      }
    }
  }

  createTrailist() async{

    List<Map<String,dynamic>> trailistLocations = []; 
    for (int i=0; i<checkedCartItems.length; i++){
      Timestamp timestamp = Timestamp.fromDate(chosenDates[checkedCartItems[i].locationId]);
      var temp = {
        "date" : timestamp,
        "locationId": checkedCartItems[i].locationId
      };
      trailistLocations.add(temp);
    }
    var tempDoc = await firebase.collection("Trailist").add({
        "trailistName" : trailistName,
        "trailistCover" : cartItems[0].img,
        "period" : {
          "start" : start,
          "end" : end,
        },
        "participants" : [
          homeController.userModel.id
        ],
        "locations" : trailistLocations
    });

    await firebase.collection("Trailist").doc(tempDoc.id).update(
      {"trailistId": tempDoc.id}
    );
    homeController.userModel.trailist!.add(tempDoc.id);
    await firebase.collection("Users").doc(homeController.userModel.id).update({
      "trailist" : homeController.userModel.trailist
    });
    
  }
}