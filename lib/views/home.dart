import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/homeController.dart';
import 'package:trailer/views/search.dart';
import 'package:trailer/widget/locationCard.dart';


class HomeView extends GetView<HomeController> {

  final _searchBar = TextEditingController();

  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
      SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(height: height * 0.05),
          Row(
            children: [
              Image(
                  image: AssetImage('lib/images/trailer_text.png'),
                  width: width * 0.23),
              SizedBox(
                width: width * 0.62,
                height: height * 0.05,
                child: TextFormField(
                  onTap: () => {Get.to(SearchView())},
                  readOnly: true,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  controller: _searchBar,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(232, 232, 232, 100), width: 2),
                        borderRadius: BorderRadius.circular(30.0)),
                    filled: true,
                    fillColor: Color.fromRGBO(246, 246, 246, 100),
                    labelText: '검색어를 입력해주세요',
                    prefixIcon: Icon(Icons.search,
                        color: Color.fromRGBO(189, 189, 189, 100)),
                    labelStyle: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(189, 189, 189, 100)),
                  ),
                ),
              ),
              Container(
                  width: width * 0.13,
                  child: IconButton(
                    color: Color.fromRGBO(254, 113, 117, 100),
                    icon: ImageIcon(AssetImage('lib/images/shoppingCart.png')),
                    onPressed: () {},
                  ))
            ],
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Icon(Icons.location_on,
                      color: Color.fromRGBO(254, 113, 117, 100)),
                  SizedBox(width: width * 0.01),
                  Text("현재 위치",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 11)),
                  SizedBox(width: width * 0.02),
                  Text("경상북도 포항시 북구 한동로 55B",
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 9))
                ],
              ),
              SizedBox(height: height * 0.03),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "포항은 현재 맑음 ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  TextSpan(
                      text: '☀️',
                      style: TextStyle(fontSize: 25, fontFamily: 'Roboto'))
                ]),
              ),
              SizedBox(height: height * 0.01),
              Text("날씨에 따라 즉흥으로 어디론가 떠나보아요!",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationCard(),
                  LocationCard(),
                  LocationCard(),
                ],
              ),
              SizedBox(height: height * 0.04),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "초록초록 여행 맛집 ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  TextSpan(
                      text: '🌱',
                      style: TextStyle(fontSize: 23, fontFamily: 'Roboto'))
                ]),
              ),
              SizedBox(height: height * 0.02),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                        image: AssetImage(
                                            'lib/images/trailist-card-1.png'),
                                        width: width * 0.6)
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 75, 0, 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("2박 3일",
                                          style: TextStyle(color: Colors.white)),
                                      SizedBox(height: height * 0.005),
                                      Row(children: [
                                        Text("떠오르는 핫플 : 함안 |",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13,
                                                color: Colors.white)),
                                        SizedBox(width: width * 0.015),
                                        Text('라엘천재',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.white)),
                                      ])
                                    ],
                                  ),
                                ),
                              ]),
                              SizedBox(width:width*0.03),
                              Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                        image: AssetImage(
                                            'lib/images/trailist-card-1.png'),
                                        width: width * 0.6)
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 75, 0, 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("2박 3일",
                                          style: TextStyle(color: Colors.white)),
                                      SizedBox(height: height * 0.005),
                                      Row(children: [
                                        Text("떠오르는 핫플 : 함안 |",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13,
                                                color: Colors.white)),
                                        SizedBox(width: width * 0.015),
                                        Text('라엘천재',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.white)),
                                      ])
                                    ],
                                  ),
                                ),
                              ]
                              )
                            ],
                  ),
                ),
              ),
              SizedBox(height: height*0.03),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "여름이었다... ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                    TextSpan(
                      text: '✨',
                      style: TextStyle(fontSize: 23, fontFamily: 'Roboto'))
                ]),
              ),
              SizedBox(height: height * 0.01),
              Text("를 절로 외치게 되는 선셋 명소들 ",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationCard(),
                  LocationCard(),
                  LocationCard(),
                ],
              ),
            ]),
          )
        ],
          ),
      ));
  }
}
