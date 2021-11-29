import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrailerCard extends StatefulWidget {
  String documentID;
  TrailerCard({required this.documentID});

  @override
  _TrailerCard createState() => _TrailerCard();
}

class _TrailerCard extends State<TrailerCard> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {
    var document = FirebaseFirestore.instance.collection('Users').doc(widget.documentID).snapshots();
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: document,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("");
        }
        var data = snapshot.data!.data();

        return Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  'https://blog.kakaocdn.net/dn/bftRiB/btqAjaghSBk/5CcN9W5qyCU8HLylVYcXb1/img.png',
                  height: 70.0,
                  width: 70.0,
                ),
              ),
              SizedBox(
                width: 200,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data!['email']),
                    Text(data['name']),
                  ]
                ),
              ),
              IconButton(
                  icon: Icon(Icons.close, size: 17.0),
                  onPressed: (){

                  }
              ),
            ],
          ),
        );
      }
    );
  }
}
