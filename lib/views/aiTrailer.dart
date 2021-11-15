import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/aiController.dart';

class AiTrailer extends GetView<AiController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Padding(
         padding: const EdgeInsets.all(30.0),
         child: 
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                Image(
                    image: AssetImage('lib/images/ai-logo.png'),
                    width: width * 0.4),
                SizedBox(width: width*0.03),
                Text(" 추천지", style:TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFA8C78), fontSize: 25))
              ],
             ),
            SizedBox(height: height*0.02),
            Text("  사진을 올려서 여행지를 추천 받으세요!", style: TextStyle(fontSize: 15, color: Color(0xff494949), fontWeight: FontWeight.w500)),
            SizedBox(height: height*0.04),
           Container(
             width: width,
              child: 
                Column(
                  children: [
                    IconButton(icon: Image.asset('lib/images/ai-add-icon.png'), iconSize: height*0.3, color: Color(0xff8B8B8B), onPressed:(){} ),
                    ElevatedButton(onPressed: (){}, child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xfffc96a0), Color(0xfffa9d90), Color(0xfff9a082),],),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container())
                        )
                  ],
                ),
              ),

                  /*ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(width*0.7, height*0.05)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        foregroundColor: MaterialStateProperty.all(Colors.transparent),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xfffc96a0), Color(0xfffa9d90), Color(0xfff9a082),],),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(5,0,15,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                    ),*/
           ],
         ),
       ),
    );
  }
}