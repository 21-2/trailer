import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrailistLocationListCard extends StatefulWidget {
  @override
  _TrailistLocationListCard createState() => _TrailistLocationListCard();
}

class _TrailistLocationListCard extends State<TrailistLocationListCard> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){

              }
          ),
          InkWell(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                      image: AssetImage('lib/images/loc-card-1.png'), width: 50)),
              onTap: () => {Get.toNamed('/details')} //여기에 argument 넣기
              ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("이스케이프 풀 빌라",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
              Text('포항시 남구 구룡포',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
            ],
          ),
          SizedBox(width: 40),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){

            }
          ),
          SizedBox(height: 10),
          Divider(
            height: 10.0,
            color: Colors.grey[850],
            thickness: 0.5,
            endIndent: 30.0,
          ),
        ],
      ),
    );
  }
}
