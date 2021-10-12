import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/homeController.dart';

class HomeView extends GetView<HomeController> {
  final _searchController = TextEditingController();

  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
                expands: true,
                minLines: null,
                maxLines: null,
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
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
          padding: const EdgeInsets.fromLTRB( 20, 0, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              children: [
                Icon(Icons.location_on,
                    color: Color.fromRGBO(254, 113, 117, 100)),
                SizedBox(width: width * 0.01),
                Text("현재 위치",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11)),
                SizedBox(width: width * 0.02),
                Text("경상북도 포항시 북구 한동로 55B",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 9))
              ],
            ),
            SizedBox(height: height*0.03),
            RichText(
              text: TextSpan(
                children:  <TextSpan>[
                  TextSpan( text: "포항은 현재 맑음 ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                  TextSpan( text: '☀️', style: TextStyle(fontSize: 25, fontFamily: 'Roboto'))
                ]
                ),
              ),
            SizedBox(height: height*0.01), 
            Text("날씨에 따라 즉흥으로 어디론가 떠나보아요!",  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
            Row(children: [
              Card()
            ],)
          ]),
        )
      ],
    ));
  }
}
