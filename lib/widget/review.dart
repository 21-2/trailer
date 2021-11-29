import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; 
class Review extends StatelessWidget{
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  Map<dynamic,dynamic> review;
  String username;



  Review({required this.review,required this.username });

  @override  
  Widget build(BuildContext context){
    DateTime dt = (review['date'] as Timestamp).toDate();
    String formattedDate = DateFormat('yyyy.MM.dd').format(dt);
    username = username.substring(0,2) + "*****";
    return Container(
       width: width*0.7,
       height: height*0.11,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1)
          )]
        ),
        child: 
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${review["review"]}", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
              Text(" $username | $formattedDate", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11)),
              
            ]
          ),
        ),
      );
  }
  
}