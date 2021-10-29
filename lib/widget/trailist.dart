import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrailistCard extends StatefulWidget {
  @override
  _TrailistCard createState() => _TrailistCard();
}

class _TrailistCard extends State<TrailistCard> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
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
                      image: AssetImage('lib/images/trailist-card-1.png'),
                      width: width * 0.9,
                      height: height * 0.2,
                      fit: BoxFit.cover)),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 75, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Text("이스케이프 풀 빌라",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white)),
                    SizedBox(height: height * 0.008),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 12),
                        SizedBox(width: width * 0.01),
                        Text('gracenho829',
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
                        Text('6곳',
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
