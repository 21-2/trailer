import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Review extends StatelessWidget{
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  @override  
  Widget build(BuildContext context){
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("타르트 종류가 다양하고 음료도 다양했어요~!", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(child: Image.asset('lib/images/loc-card-2.png', width: width*0.08)),
                  SizedBox(width: width*0.03),
                  Text("gracenho829 | 2021.09.10", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10)),
              ],
            )
            ]
          ),
        ),
      );
  }
  
}