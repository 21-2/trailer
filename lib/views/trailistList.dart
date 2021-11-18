import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/trailistController.dart';

class TrailistList extends GetView<TrailistController>{
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         foregroundColor: Colors.transparent,
         shadowColor: Colors.transparent,
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        actions: [
          IconButton(
          icon: Icon(Icons.border_color_outlined,),
          onPressed: (){},
          ), 
        ],
       ),
       body: SingleChildScrollView(
         child: Column(
            children:[Container(
            decoration: BoxDecoration(
              boxShadow: 
              [
                BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2)
              )]),
            child: 
            Stack(

              children: [
               
              Image(image: AssetImage('lib/images/detailExample/escape-1.png'), fit: BoxFit.cover,),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('21.09.18 ~ 21.09.27', style: TextStyle(fontWeight: FontWeight.w500, fontSize:16, color: Colors.white)),
                    SizedBox(height: height*0.01),
                    Text('오사카 일본 2박 3일', style: TextStyle(fontWeight: FontWeight.w700, fontSize:20, color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                      Icon(Icons.person, color: Colors.white),
                       IconButton(icon: Icon(Icons.map, color: Colors.white), onPressed: (){},), 
                    ])
                  ],
                )),
              ]
            ),
          ),
          SizedBox(height: height*0.05),
          ]
         )
       )
     );
  }
}