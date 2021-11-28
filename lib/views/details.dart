import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/detailController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trailer/widget/locationCard.dart';
import 'package:trailer/widget/review.dart';

class DetailView extends GetView<DetailController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder(
      future: controller.setLocation(),
      builder: (context, snapshot){
     return  Scaffold(
        bottomNavigationBar: 
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.shade200, spreadRadius: 5, blurRadius: 5, offset: Offset(2,6))]),
                    child: ElevatedButton(
                      onPressed: ()=>{}, child: Text('트레일리스트에 담기', style: TextStyle(color: Color.fromRGBO(251, 124, 113, 100), fontSize: 15)), 
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size.fromWidth(width*0.4)),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0,15,0,15)),
                        shape: MaterialStateProperty.all(StadiumBorder(side: BorderSide(width: 3, color: Color.fromRGBO(255, 152, 162, 100)))),
                      )
                      )
                    ),
                   Container(
                  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.shade200, spreadRadius: 5, blurRadius: 5, offset: Offset(2,6))]),
                    child: ElevatedButton(
                      onPressed: ()=>{
                        print(controller.reviewUsers)
                      }, child: Text('장바구니에 담기', style: TextStyle(color: Colors.white, fontSize: 15)), 
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size.fromWidth(width*0.4)),
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 152, 162, 100)),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0,15,0,15)),
                        shape: MaterialStateProperty.all(StadiumBorder(side: BorderSide(width: 3, color: Color.fromRGBO(255, 152, 162, 100)))),
                      )
                      )
                    ),
                ]
              ),
        ),
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
                  CarouselSlider(
                  options: CarouselOptions(height: height * 0.3, autoPlay: true, enableInfiniteScroll: true, autoPlayInterval:Duration(seconds:3),autoPlayAnimationDuration: Duration(milliseconds: 2000), autoPlayCurve: Curves.linearToEaseOut),
                  items: [1, 2, 3, 4].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.zero,
                            child: Image(image: AssetImage('lib/images/detailExample/escape-$i.png'), fit: BoxFit.cover,));
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${controller.currentLocation.locationName}', style: TextStyle(fontWeight: FontWeight.w700, fontSize:20, color: Colors.white)),
                      Row(
                        children:[
                        Container(
                          child: Row(
                            children: [
                              Obx(()=>Container(
                                padding: const EdgeInsets.all(0),
                                child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  icon: (controller.favorited.value
                                      ?  Icon(Icons.favorite)
                                      : Icon(Icons.favorite_border)),
                                  color: Colors.white,
                                  
                                  onPressed: (){
                                    controller.favorited.toggle();
                                    },
                                ),
                              )),
                            ],
                          )
                        ),
                        Text('${controller.currentLocation.likes}', style:TextStyle(fontSize: 15, color: Colors.white ))
                      ])
                    ],
                  )),
                ]
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 20, 15),
            child: 
            Container( 
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: 
              BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color:Colors.grey.shade100),
                boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2)
              )]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Icon(Icons.location_on_outlined, color: Colors.grey.shade500),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12,8,10),
                    child: Text('${controller.currentLocation.address}',),
                  )
                ],),
               /*Row(children: [
                 Icon(Icons.schedule_outlined, color: Colors.grey.shade500),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12,8,10),
                    child: Text('매일 10:00 ~ 22:00',),
                  )
                ],),*/
                Row(children: [ 
                  Icon(FontAwesomeIcons.instagram, color: Colors.grey.shade500),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8,10),
                    child: Text('@_cafemond',),
                  )
                ],),
                Row(children: [
                  Icon(Icons.phone_outlined, color: Colors.grey.shade500),
                  Padding(
                     padding: const EdgeInsets.fromLTRB(8, 12,8,10),
                    child: Text('${controller.currentLocation.phoneNumber}',),
                  )
                ],),
              ],
            ),
        ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("방문자 리뷰", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                    Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(width*0.43, height*0.05)),
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          foregroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {},
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color.fromRGBO(252, 150, 160, 100), Color.fromRGBO(250, 157, 144, 100), Color.fromRGBO(249, 160, 130, 100),],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(5,0,9,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.edit, color: Colors.white, size: 20),
                                Text(
                                  "리뷰 작성하기",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.02),
                Container(
                 child: SingleChildScrollView( 
                     scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i=0; i< controller.currentLocation.reviews!.length; i++)
                           Row(children:[Review(review:controller.currentLocation.reviews![i], username: controller.reviewUsers[0]),SizedBox(width:width*0.03),])

                      ]
                    )
                 ),
                ), 
                SizedBox(height: height*0.04),
                Text("비슷한 장소들", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                SizedBox(height: height*0.02),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    LocationCard(documentID: controller.firstRowLocations[0]),
                    LocationCard(documentID: controller.firstRowLocations[1]),
                    LocationCard(documentID: controller.firstRowLocations[2]),
                    ],
                  ),
              ],
            ),
          )
          ],
        ),
      )
      );
      }
    );
  }
}
