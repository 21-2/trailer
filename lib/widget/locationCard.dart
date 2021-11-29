import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/detailController.dart';

import 'package:trailer/model/Locations.dart';

class LocationCard extends StatefulWidget{

  String documentID;
  LocationCard({required this.documentID});

  @override 
  _LocationCard createState() => _LocationCard();
}

class _LocationCard extends State<LocationCard>{

  late Locations currentLocation;
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  DetailController detailController = Get.find<DetailController>();
  var favorited = false;

  String clippedAddress(String address){
    if (address.length> 11){
      return address.substring(5,15);
    }
    return address;
  }
   void _toggleFavorite() {
    setState(() {
      if (favorited) {
       
        favorited = false;
      } else {
        favorited = true;
      }
    });
  }

  Future<void>?setLocation() async{
        currentLocation = await FirebaseFirestore.instance
        .collection('Location')
        .doc(widget.documentID)
        .get()
        .then((doc) => Locations.fromSnapshot(doc));
  }
  
  @override  
  Widget build(BuildContext context){
    setLocation();
    Widget heart = Container(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: (favorited
                    ? Icon(Icons.favorite, color: Color(0xffFE4D68)) :  Icon(Icons.favorite_border)), 
                color: Colors.white,
                onPressed: ()=>{_toggleFavorite()},
              ),
            ),
          ],
        )
      );

    return Container(
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(currentLocation.img!, height: height*0.14, width:height*0.14, fit: BoxFit.fill,)
                ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(50, 65, 0, 0),
                   child: heart,
                 ),
              ]
            ),
            onTap: (){
              
              detailController.documentId = widget.documentID;
              detailController.update();
              detailController.setLocation();

              Get.toNamed('/details', preventDuplicates:false);
            
              } //여기에 argument 넣기 
          ),
          SizedBox(height: height*0.02), 
          Text(currentLocation.locationName!, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          SizedBox(height: height*0.008), 
          Text(clippedAddress(currentLocation.address!), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12), overflow: TextOverflow.clip),
        ],
        
      ),
      );
  }
}