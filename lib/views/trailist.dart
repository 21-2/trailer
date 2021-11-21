import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/detailController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trailer/widget/locationCard.dart';
import 'package:trailer/widget/review.dart';
import 'package:trailer/widget/trailistLocationListCard.dart';

class TrailistView extends GetView<DetailController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage('lib/images/detailExample/escape-1.png'),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {})
                    ],
                  )),
              Positioned(
                  bottom: 10,
                  left: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('21.11.18 ~ 21.11.20',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.white)),
                      SizedBox(height: 3),
                      Text('제주도 (feat. 자연)',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      SizedBox(height: 10),
                      Row(children: [
                        Icon(Icons.person, color: Colors.white),
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            'https://blog.kakaocdn.net/dn/bftRiB/btqAjaghSBk/5CcN9W5qyCU8HLylVYcXb1/img.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            'https://blog.kakaocdn.net/dn/bftRiB/btqAjaghSBk/5CcN9W5qyCU8HLylVYcXb1/img.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            'https://blog.kakaocdn.net/dn/bftRiB/btqAjaghSBk/5CcN9W5qyCU8HLylVYcXb1/img.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                        )
                      ]),
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
                              color: Color.fromRGBO(254, 113, 117, 100),
                              size: 30.0),
                          onPressed: () {})
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
                                    const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: Column(children: [
                                  Row(children: [
                                    Icon(Icons.location_pin),
                                    Text('6곳'),
                                  ]),
                                  Text(
                                    '18 Thursday',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color:
                                            Color.fromRGBO(254, 113, 117, 100)),
                                  ),
                                  TrailistLocationListCard(),
                                  TrailistLocationListCard(),
                                  SizedBox(height: 20),
                                  Text(
                                    '19 Friday',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color:
                                            Color.fromRGBO(254, 113, 117, 100)),
                                  ),
                                  TrailistLocationListCard(),
                                  TrailistLocationListCard(),
                                  SizedBox(height: 20),
                                  Text(
                                    '20 Saturday',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color:
                                            Color.fromRGBO(254, 113, 117, 100)),
                                  ),
                                  TrailistLocationListCard(),
                                  TrailistLocationListCard(),
                                ])))
                      ]))),
        ],
      ),
    ));
  }
}
