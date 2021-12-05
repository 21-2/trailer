
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/favoritesController.dart';
import 'package:trailer/controller/trailistController.dart';
import 'package:trailer/widget/trailistLocationListCard.dart';
import 'package:intl/intl.dart';

class TrailistView extends GetView<TrailistController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  FavoritesController favoriteController = Get.find<FavoritesController>();

  /*Widget setTrailer(){
    int count = 0;
    return ${data["locations"].length}
  }*/

  @override
  Widget build(BuildContext context) {
    var document = FirebaseFirestore.instance.collection('Trailist').doc('${controller.documentId}').snapshots();
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: document,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("");
        }
        var data = snapshot.data!.data();
        //var size = data!['locations'].length();
        String start = data!['period']['start'].toDate().toString().split(" ")[0];
        String end = data['period']['end'].toDate().toString().split(" ")[0];
        String date = start + ' ~ ' + end;

        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2))
                ]),
                child: Stack(children: [
                  Image(
                    image: NetworkImage(data['trailistCover']),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 300,
                      left: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Get.back();
                              })
                        ],
                      )),
                  Positioned(
                      bottom: 300,
                      left: 330,
                      child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () => {Get.toNamed('/setTrailist')}
                      )),
                  Positioned(
                      bottom: 10,
                      left: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(date,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          Text(data['trailistName'],
                              style: TextStyle(fontSize: 20, color: Colors.white)),
                          SizedBox(height: 8),
                          Row(
                              children: [
                            Icon(Icons.person, color: Colors.white),
                          ]),
                            SizedBox(height: 10),
                        ],
                      )),
                  Positioned(
                      bottom: 10,
                      left: 330,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: Icon(Icons.map,
                                  color: Colors.white,
                                  size: 30.0),
                              onPressed: () {
                                controller.locationList = data['locations'];
                                controller.getGeolocation();
                                Get.toNamed('/googlemap');
                              })
                        ],
                      )),
                ]),
              ),
              SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                                child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 20, 0, 0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Icon(Icons.location_pin),
                                            Text('3곳'),
                                          ]),
                                          SizedBox(height: height*0.03),
                                          Row(
                                            children: [
                                              Text(
                                                data['locations'][0]['date'].toDate().toString().substring(8,10),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 25,
                                                    color: Color(0xffFB7C71)),
                                              ),
                                              SizedBox(width:width*0.02),
                                              Text(
                                                DateFormat('EEEE').format(data['locations'][0]['date'].toDate()),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    color: Color(0xffFB7C71)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height*0.01),
                                          TrailistLocationListCard(documentID: data['locations'][0]['locationId'],
                                              date: data['locations'][0]['date'].toDate().toString()),
                                          SizedBox(height: 15),
                                         Row(
                                            children: [
                                              Text(
                                                data['locations'][1]['date'].toDate().toString().substring(8,10),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 25,
                                                    color: Color(0xffFB7C71)),
                                              ),
                                              SizedBox(width:width*0.02),
                                              Text(
                                                DateFormat('EEEE').format(data['locations'][1]['date'].toDate()),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    color: Color(0xffFB7C71)),
                                              ),
                                            ],
                                          ),
                                           SizedBox(height: height*0.01),
                                          TrailistLocationListCard(documentID: data['locations'][1]['locationId'],
                                              date: data['locations'][1]['date'].toDate().toString()),
                                          SizedBox(height: 15),
                                           Row(
                                            children: [
                                              Text(
                                                data['locations'][2]['date'].toDate().toString().substring(8,10),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 25,
                                                    color: Color(0xffFB7C71)),
                                              ),
                                              SizedBox(width:width*0.02),
                                              Text(
                                                DateFormat('EEEE').format(data['locations'][2]['date'].toDate()),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    color: Color(0xffFB7C71)),
                                              ),
                                            ],
                                          ),
                                           SizedBox(height: height*0.01),
                                          TrailistLocationListCard(documentID: data['locations'][2]['locationId'],
                                              date: data['locations'][2]['date'].toDate().toString()),
                                        ])))
                          ]))),
            ],
          ),
        ));
      }
    );
  }
}

