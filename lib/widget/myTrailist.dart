import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/favoritesController.dart';
import 'package:trailer/controller/trailistController.dart';
import 'package:trailer/model/Trailist.dart';

class MyTrailistCard extends StatefulWidget {
  String documentID;
  MyTrailistCard({required this.documentID});

  @override
  _MyTrailistCard createState() => _MyTrailistCard();
}

class _MyTrailistCard extends State<MyTrailistCard> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  TrailistController trailistController = Get.find<TrailistController>();
  //FavoritesController favoriteController = Get.find<FavoritesController>();

  /*Future<void>?setTrailist() async{
    print("trailist 셋팅!!");
    currentTrailist = await FirebaseFirestore.instance
        .collection('Trailist')
        .doc(widget.documentID)
        .get()
        .then((doc) => Trailist.fromSnapshot(doc));
        setCover();

  }
  }*/


  @override
  Widget build(BuildContext context) {
    var document = FirebaseFirestore.instance.collection('Trailist').doc(widget.documentID).snapshots();
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: document,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("");
        }
        var data = snapshot.data!.data();
        return 
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                 trailistController.documentId= widget.documentID;
                  Get.toNamed('/trailist', preventDuplicates:false);
                },
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                            image: NetworkImage(data!['trailistCover']),
                            width: width * 0.9,
                            height: height * 0.22,
                            fit: BoxFit.cover)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 70, 0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.02),
                          Text(data!['trailistName'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white)),
                          SizedBox(height: height * 0.008),
                          Row(
                            children: [
                              Icon(Icons.person, color: Colors.white, size: 12),
                              SizedBox(width: width * 0.01),
                              Text('gracenho829 외 2명',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: height * 0.005),
                          Row(
                            children: [
                              Icon(Icons.event, color: Colors.white, size: 12),
                              SizedBox(width: width * 0.01),
                              Text('2021. 09. 18 ~ 2021. 09. 21',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white, size: 12),
                              SizedBox(width: width * 0.01),
                              Text('${data["locations"].length} 곳',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
