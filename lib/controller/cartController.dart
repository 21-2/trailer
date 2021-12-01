import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/model/Locations.dart';


class CartController extends GetxController {

  List<dynamic> cartItemsDocumentId=[];
  List<Locations> cartItems= [];

  HomeController homeController = Get.find<HomeController>();
  @override
    void onInit() async {
      await setCartItems();
      super.onInit();
    }

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
    }

  setCartItems() async{
    cartItemsDocumentId = [];
    cartItems = [];
   cartItemsDocumentId = homeController.userModel.cart!;
   FirebaseFirestore firebase = FirebaseFirestore.instance;
   for (int i=0; i<cartItemsDocumentId.length; i++){
     Locations tempLocation = await firebase.collection("Location").doc(cartItemsDocumentId[i]).get().then((doc)=>Locations.fromSnapshot(doc));
     cartItems.add(tempLocation);

   }

  }
}