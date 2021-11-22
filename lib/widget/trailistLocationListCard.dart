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
      child: Column(
        children: [
          Row(
            children: [
              Text('9:00 AM'),
              SizedBox(width: 5),
              InkWell(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                          image: AssetImage('lib/images/loc-card-1.png'), width: 50)),
                  onTap: () => {Get.toNamed('/details')} //여기에 argument 넣기
                  ),
              SizedBox(width: 10),
              InkWell(
                child: SizedBox(
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("이스케이프 풀 빌라",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                      SizedBox(height: 3),
                      Text('포항시 남구 구룡포',
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
                    ],
                  ),
                ),
                onTap: () {
                  FlutterDialog(context);
                }
              ),
              IconButton(
                  icon: Icon(Icons.close, size: 17.0),
                  onPressed: (){

                  }
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(
            height: 10.0,
            color: Colors.grey[850],
            thickness: 0.5,
            endIndent: 20.0,
          ),
        ],
      ),
    );
  }
}

void FlutterDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              Text("일정 수정"),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Dialog Content",
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("취소"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("저장"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

