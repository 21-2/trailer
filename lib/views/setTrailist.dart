import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/controller/trailistController.dart';

class SetTrailist extends GetView<TrailistController>{
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color:Colors.black26),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30, 10),
              child: Column(
                  children:[
                    Row(
                      children: [
                        Text(
                          '제주도 (Fe',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color.fromRGBO(
                                  254, 113, 117, 100)),
                        ),
                      ],
                    ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Input',
                    )
                  ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          '트래블러 초대하기',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color.fromRGBO(
                                  254, 113, 117, 100)),
                        ),
                      ],
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: '이메일을 입력하세요',
                        )
                    ),
                    SizedBox(
                      width: 20,
                      child: Column(
                        children: [

                        ]
                      )
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: ()=>{},
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xffFE4D68),Color(0xffFA9D90), Color(0xffF9A082)]),
                            borderRadius: BorderRadius.all(Radius.circular(80.0)),
                          ),
                          child: Container(
                            constraints: BoxConstraints(minWidth: width*0.8, minHeight: 36.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: const Text(
                                '트레일리스트 수정하기',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 15)
                            ),
                          ),
                        ),
                        style:
                        ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size.fromWidth(width*0.8)),
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        )
                    )
                  ]
              ),
            )
        )
    );
  }
}