import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/cartController.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:trailer/views/cart2.dart';

class CartView extends GetView<CartController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  int count =0;
  
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("날짜를 정해주세요", style: TextStyle(color: Color.fromRGBO(251, 124, 113, 100), fontWeight: FontWeight.bold)),
        content: 
          Container(
           width: width*0.8,
           height: height*0.4,
           child: Column(
             children: [
               SfDateRangePicker(
                  onSelectionChanged:(DateRangePickerSelectionChangedArgs args){
                        controller.start = args.value.startDate;
                        controller.end = args.value.endDate;
                  },
                  selectionMode: DateRangePickerSelectionMode.range,
                   initialSelectedRange: PickerDateRange(
                        DateTime.now(),
                        DateTime.now().add(const Duration(days: 1))),
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
             controller.startString.value =  DateFormat('MM/dd/yyyy').format(controller.start).toString();
             controller.endString.value =  DateFormat('dd/MM/yyyy').format(controller.end).toString();
             Get.to(CartView2(), transition: Transition.fadeIn);
            }, 
            child: Text('다음', style: TextStyle(color: Colors.white, fontSize: 12)), 
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
        future: controller.setCartItems(),
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
              bottomNavigationBar: 
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                       style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                         
                        ),
                        onPressed: (){
                          if(count == 0) 
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("한개 이상의 로케이션을 선택해주세요!")));

                        else {

                          createAlertDialog(context);
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffFC96A0),Color(0xffFA9D90), Color(0xffF9A082)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(minWidth: width*0.6, minHeight: 36.0, maxHeight: height*0.05, maxWidth: width*0.7), 
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(5, 0, 9, 0),
                            child: 
                                Text(
                                  "체크아웃 하러 가기",
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
                    onPressed: () => Get.back()),
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
                      Obx(()=>ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.cartItemsDocumentId.length,
                        itemBuilder: (context, index) {
                         return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Obx(()=>Checkbox(
                                  value: controller.itemChecked[index].value,
                                  onChanged: (bool? value) {
                                   controller.itemChecked[index].value = value!;
                                   if (controller.itemChecked[index].value) count ++;
                                   else count --;
                                    controller.update();
                                    
                                  },
                                  shape: CircleBorder(),
                                  fillColor: MaterialStateProperty.all(
                                      Color(0xffFB7C71)),
                                  checkColor: Colors.white,
                                )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image.network(
                                        controller.cartItems[index].img!,
                                        height: height * 0.1,
                                        width: height * 0.1,
                                        fit: BoxFit.fill)),
                                SizedBox(width: width * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller
                                            .cartItems[index].locationName!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13)),
                                    SizedBox(height: height * 0.008),
                                    Text(
                                        clippedAddress(controller
                                            .cartItems[index].address!),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                        overflow: TextOverflow.clip),
                                  ],
                                ),
                                SizedBox(width: width * 0.05),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    controller.removeCartItems(index);
                                  },
                                )
                              ],
                            ),
                          );
                        }),
                      )
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
