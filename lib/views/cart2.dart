import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/cartController.dart';
import 'package:intl/intl.dart';
import 'package:trailer/controller/dashboardController.dart';
import 'package:trailer/controller/trailistController.dart';


class CartView2 extends GetView<CartController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  FirebaseFirestore firebase = FirebaseFirestore.instance;

  DashboardController dashboardController = Get.find<DashboardController>();
    TextEditingController trailistName = TextEditingController();
    TextEditingController findFriends = TextEditingController();
    createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("날짜를 정해주세요", style: TextStyle(color: Color.fromRGBO(251, 124, 113, 100), fontWeight: FontWeight.bold)),
        content: 
          Container(
           width: width*0.8,
           height: height*0.4,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Text("여행 이름", style:TextStyle(color:Color(0xffFB7C71), fontWeight: FontWeight.w600)),
                TextField(
                  controller: trailistName
                ),
                SizedBox(height: height*0.02,),
                  Text("트래블러를 선택해주세요", style:TextStyle(color:Color(0xffFB7C71), fontWeight: FontWeight.w600)),
                  TextField(
                    controller: findFriends
                  ),
             ],
           )
          ),
        actions: [
         ElevatedButton(
            onPressed: (){Navigator.pop(context);}, 
            child: Text('취소', style: TextStyle(color: Color.fromRGBO(251, 124, 113, 100), fontSize: 12)), 
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size.fromWidth(width*0.25)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0,15,0,15)),
              shape: MaterialStateProperty.all(StadiumBorder(side: BorderSide(width: 1, color: Color.fromRGBO(255, 152, 162, 100)))),
            )
          ),
          ElevatedButton(
            onPressed: (){
              controller.trailistName =  trailistName.text;
              controller.createTrailist();
              Navigator.pop(context);
              dashboardController.tabIndex = 2;
              dashboardController.update();
              Get.offAndToNamed('/dashboard');
            }, 
            child: Text('생성하기!', style: TextStyle(color: Colors.white, fontSize: 12)), 
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size.fromWidth(width*0.25)),
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 152, 162, 100)),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0,15,0,15)),
              shape: MaterialStateProperty.all(StadiumBorder(side: BorderSide(width: 1, color: Color.fromRGBO(255, 152, 162, 100)))),
            )
          ),
        ],
        
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.setChosenItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Container(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(232, 232, 232, 1)),
                  ),
                ],
              ),
            );

          return Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          createAlertDialog(context);
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffFC96A0),
                                  Color(0xffFA9D90),
                                  Color(0xffF9A082)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                minWidth: width * 0.6,
                                minHeight: 36.0,
                                maxHeight: height * 0.05,
                                maxWidth: width * 0.7),
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(5, 0, 9, 0),
                            child: Text(
                              "트레일리스트 만들기",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.chevron_left, color: Color(0xffFB7C71)),
                    onPressed: (){
                      controller.checkedCartItems = [];
                      Get.back();
                      }),
                shadowColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                title: Row(children: [
                  SizedBox(width: width * 0.15),
                  Image(
                      image: AssetImage('lib/images/trailer_text.png'),
                      width: width * 0.23),
                  Text("장바구니",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xffFB7C71),
                          fontSize: 13)),
                ]),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.05),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.checkedCartItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: Image.network(
                                          controller.checkedCartItems[index].img!,
                                          height: height * 0.1,
                                          width: height * 0.1,
                                          fit: BoxFit.fill)),
                                  SizedBox(width: width * 0.01),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          controller
                                              .checkedCartItems[index].locationName!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13)),
                                      SizedBox(height: height * 0.008),
                                      Text(
                                          clippedAddress(controller
                                              .checkedCartItems[index].address!),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                          overflow: TextOverflow.clip),
                                    ],
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Obx(()=>Text(DateFormat('MM/dd/yyyy').format(controller.chosenDates[controller.checkedCartItems[index].locationId]).toString())),

                                 TextButton(
                                    child: 
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today, color: Color(0xffFB7C71), size: width*0.04),
                                        SizedBox(width: width*0.01),
                                        Text("선택", style: TextStyle(color: Color(0xffFB7C71)),),
                                      ],
                                    ),
                                    onPressed: () {
                                       DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: controller.start,
                                          maxTime: controller.end.add(const Duration(days: 1)),
                                          theme: DatePickerTheme(
                                              backgroundColor: Colors.white,
                                              itemStyle: TextStyle(
                                                  color: Color(0xffFB7C71),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              doneStyle:
                                                  TextStyle(color: Color(0xffFB7C71), fontSize: 16)),
                                          onChanged: (date) {

                                      }, onConfirm: (date) {
                                          controller.chosenDates[controller.checkedCartItems[index].locationId!] =  date;
                                          controller.update();
                                      }, 
                                      currentTime: DateTime.now(), locale: LocaleType.ko);
                                    },
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ));
        });
  }

  String clippedAddress(String address) {
    if (address.length > 11) {
      return address.substring(5, 15);
    }
    return address;
  }
}
