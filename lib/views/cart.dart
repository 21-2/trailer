import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/cartController.dart';
import 'package:trailer/model/Locations.dart';


class CartView extends GetView<CartController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  @override 
  Widget build(BuildContext context){
    return
    FutureBuilder(
      future: controller.setCartItems(),
       builder: (context, snapshot){
         if(snapshot.connectionState == ConnectionState.waiting) 
         return 
         Container(
           width: width,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               CircularProgressIndicator(
                 valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(232, 232, 232, 1)),
               ),
             ],
           ),
         );
       
       return Scaffold(
         appBar: AppBar(
           leading: IconButton(
             icon: Icon(Icons.chevron_left, color: Color(0xffFB7C71)),
             onPressed: ()=>Get.back()),
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                SizedBox(width: width*0.15),
                Image(
                    image: AssetImage('lib/images/trailer_text.png'),
                    width: width * 0.23),
                Text("장바구니",style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xffFB7C71), fontSize: 13)),
              ]
            ),
            centerTitle: true,
         ),
          body: 
        SingleChildScrollView(
          child: 
           Column(
             children: [
               SizedBox(height: height*0.05),
               ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    
                    RxBool isChecked = false.obs;
                    return 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Checkbox(value: isChecked.value, onChanged: (bool? state){
                            isChecked.value = state!;
                          }),
                         ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Image.network(controller.cartItems[index].img!, height: height*0.1, width: height*0.1, fit:BoxFit.fill)
                          ),
                          SizedBox(width: width*0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(controller.cartItems[index].locationName!, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                            SizedBox(height: height*0.008), 
                            Text(clippedAddress(controller.cartItems[index].address!), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12), overflow: TextOverflow.clip),
                          ],),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: (){
                              
                            },
                          )
                          
                        ],
                      ),
                    );
                  }
                ),
             ],
           ),
          )
        );
       }
      );

  }

  String clippedAddress(String address){
    if (address.length> 11){
      return address.substring(5,15);
    }
    return address;
  }



}