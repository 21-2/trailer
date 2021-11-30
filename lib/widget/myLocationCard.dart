import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/detailController.dart';

class MyLocationCard extends StatefulWidget {
  String documentID;
  MyLocationCard({required this.documentID});

  @override
  _MyLocationCard createState() => _MyLocationCard();
}

class _MyLocationCard extends State<MyLocationCard> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  var favorited = true;

  DetailController detailController = Get.find<DetailController>();

  void _toggleFavorite() {
    setState(() {
      if (favorited) {
        favorited = false;
      } else {
        favorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var document = FirebaseFirestore.instance.collection('Location').doc(widget.documentID).snapshots();
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: document,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("");
          }
          var data = snapshot.data!.data();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                            image: NetworkImage(data!['img']),
                            height: height * 0.13, width: height * 0.13, fit: BoxFit.cover)),
                    onTap: () {
                      detailController.documentId = widget.documentID;
                      detailController.update();
                      detailController.setLocation();
                      Get.toNamed('/details', preventDuplicates:false);
                    },
                ),
                SizedBox(height: height * 0.02),
                Text(data!['locationName'], style: TextStyle(fontSize: 13)),
                SizedBox(height: height * 0.008),
                Text(data!['city'],
                    style: TextStyle(fontSize: 12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      iconSize: 25,
                      icon: (favorited
                          ? Icon(Icons.favorite, color: Color(0xffFE4D68))
                          : Icon(Icons.favorite_border, color: Colors.grey)),
                      onPressed: () {
                        _toggleFavorite();
                      },
                    ),
                    Text(data!['likes'].toString(), style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}
