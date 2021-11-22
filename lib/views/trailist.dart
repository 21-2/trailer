import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/detailController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trailer/widget/locationCard.dart';
import 'package:trailer/widget/review.dart';

class TrailistView extends GetView<DetailController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child:
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow:
                    [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2)
                    )]),
                child: Stack(
                    children: [
                      Image(image: AssetImage('lib/images/detailExample/escape-1.png'), fit: BoxFit.cover,),
                      Positioned(
                          bottom: 300,
                          left: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: (){
                                    Get.back();
                                  }
                              )
                            ],
                          )
                      ),
                      Positioned(
                          bottom: 300,
                          left: 330,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: (){
                                    print('clicked edit button!!!!!');
                                  }
                              )
                            ],
                          )
                      ),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('21.11.18 ~ 21.11.20', style: TextStyle(fontWeight: FontWeight.w700, fontSize:15, color: Colors.white)),
                              Text('제주도 (feat. 자연)', style: TextStyle(fontWeight: FontWeight.w700, fontSize:20, color: Colors.white)),
                              Row(
                                  children:[
                                    Icon(Icons.person),
                                    Text('참여자img here', style:TextStyle(fontSize: 15, color: Colors.white ))
                                  ]),
                            ],
                          )
                      ),
                      Positioned(
                          bottom: 10,
                          left: 330,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.map),
                                onPressed: (){
                                  print('clicked map button!!!!!');
                                }
                              )
                            ],
                          )
                      ),
                    ]
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Icon(Icons.map_marker),
                  Text('6곳'),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 20),
                  child: Row(
                    children: [
                      Text('2021.11.18 Thu'),
                      SizedBox(height: 10),
                      Text('2021.11.19 Fri'),
                      SizedBox(height: 10),
                      Text('2021.11.20 Sat'),
                    ]
                  )
              ),

            ],
          ),
        )
    );
  }
}
