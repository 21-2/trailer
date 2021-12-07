import 'package:flutter/material.dart';
import 'package:trailer/model/Trailist.dart';
import 'package:get/get.dart';

class TrailistCard extends StatefulWidget {
  final Trailist? result;

  TrailistCard({required this.result});

  @override
  _TrailistCard createState() => _TrailistCard(result: result);
}

class _TrailistCard extends State<TrailistCard> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  Trailist? result;
  _TrailistCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                      image: NetworkImage(result!.trailistCover!),
                      width: width * 0.9,
                      height: height * 0.2,
                      fit: BoxFit.cover)),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 75, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Text(result!.trailistName!,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white)),
                    SizedBox(height: height * 0.008),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 12),
                        SizedBox(width: width * 0.01),
                        //누구를 기준으로 표시할 것인지? --> 오너가 누구인지!
                        Text(result!.participants![0],
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: height * 0.005),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 12),
                        SizedBox(width: width * 0.01),
                        //Trailist 안에 개수 몇 개인지
                        Text(result!.locations!.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.white)),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.005,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
