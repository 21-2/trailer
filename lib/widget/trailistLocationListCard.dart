import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/detailController.dart';

class TrailistLocationListCard extends StatefulWidget {
  String documentID;
  String date;
  TrailistLocationListCard({required this.documentID, required this.date});

  @override
  _TrailistLocationListCard createState() => _TrailistLocationListCard();
}

String date = "2021-11-18";
String time = "09:00";

late String name;
late String city;

class _TrailistLocationListCard extends State<TrailistLocationListCard> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  DetailController detailController = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    var document = FirebaseFirestore.instance.collection('Location').doc(widget.documentID).snapshots();

    date = widget.date.split(" ")[0];
    time = widget.date.split(" ")[1];

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: document,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("");
        }
        var data = snapshot.data!.data();

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            children: [
              Row(
                children: [
               
                  SizedBox(width: 5),
                  InkWell(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                              image: NetworkImage(data!['img']), width: 50, height: 50)),
                      onTap: () {
                        detailController.documentId = widget.documentID;
                        detailController.update();
                        detailController.setLocation();
                        Get.toNamed('/details');
                      }
                      ),
                  SizedBox(width: 10),
                  InkWell(
                    child: SizedBox(
                      width: width*0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['locationName'],
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                          SizedBox(height: 3),
                          Text(data['city'],
                              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
                        ],
                      ),
                    ),
                    onTap: () {
                      name = data['locationName'];
                      city = data['city'];
                      date = widget.date.split(" ")[0];
                      time = widget.date.split(" ")[1].split(".")[0];
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
              SizedBox(height:height*0.02),
               Divider(
                height: 10.0,
                color: Colors.grey[850],
                thickness: 0.5,
                endIndent: 20.0,
               )

            ],
          ),
        );
      }
    );
  }
}

void FlutterDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          // RoundedRectangleBorder - Dialog ?????? ????????? ????????? ??????
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              Text(name),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                city,
                  style: TextStyle(fontSize: 13)
              ),
              Text(date + ' ' + time,
                  style: TextStyle(fontSize: 13)),
              Row(
                children: [
                  ElevatedButton(
                    child: Text('?????? ?????????'),
                    onPressed: (){
                      showDatePickerPop(context);
                    }
                  ),
                  ElevatedButton(
                      child: Text('?????? ?????????'),
                      onPressed: (){
                        showTimePickerPop(context);
                      }
                  )
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("??????"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text("??????"),
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
    initialDate: DateTime.now(), //?????????
    firstDate: DateTime(2020), //?????????
    lastDate: DateTime(2022), //????????????
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.dark(), //?????? ??????
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
      //gravity: ToastGravity.CENTER,  //??????(default ??? ??????)
    );*/
  });
}



