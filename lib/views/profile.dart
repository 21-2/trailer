import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailer/controller/homeController.dart';

class ProfileView extends GetView<HomeController> {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: 
      SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network('${controller.firebaseAuth.currentUser!.photoURL}',)
            ),
            SizedBox(height: height*0.05,),
            ElevatedButton(
                      onPressed: ()=>{controller.signOut()},
                      child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xffFE4D68),Color(0xffFA9D90), Color(0xffF9A082)]),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: BoxConstraints(minWidth: width*0.8, minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          '로그아웃하기',
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
            );
  }
}