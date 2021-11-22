import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrailistLocationListCard extends StatefulWidget {
  @override
  _TrailistLocationListCard createState() => _TrailistLocationListCard();
}

String date = "2021.11.18 (THU)";
String time = "9:00 AM";

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
              Text("이스케이프 풀 빌라"),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "장소: 포항시 남구 구룡포",
                  style: TextStyle(fontSize: 13)
              ),
              Text(date + ' ' + time,
                  style: TextStyle(fontSize: 13)),
              Row(
                children: [
                  FlatButton(
                    child: Text('날짜 재설정'),
                    onPressed: (){
                      showDatePickerPop(context);
                    }
                  ),
                  FlatButton(
                      child: Text('시간 재설정'),
                      onPressed: (){
                        showTimePickerPop(context);
                      }
                  )
                ],
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

void showDatePickerPop(context) {
  Future<DateTime?> selectedDate = showDatePicker(
    context: context,
    initialDate: DateTime.now(), //초기값
    firstDate: DateTime(2020), //시작일
    lastDate: DateTime(2022), //마지막일
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.dark(), //다크 테마
        child: child!,
      );
    },
  );

  selectedDate.then((dateTime) {
    /*setState(() {
        date = dateTime.toString();
        date = date.split(" ")[0];
        print(date);
      });*/
  });
}

void showTimePickerPop(context) {
  Future<TimeOfDay?> selectedTime = showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  selectedTime.then((timeOfDay) {
    /*Fluttertoast.showToast(
      msg: timeOfDay.toString(),
      toastLength: Toast.LENGTH_LONG,
      //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
    );*/
  });
}



