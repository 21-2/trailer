import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:trailer/controller/loginController.dart';
import 'package:get/get.dart';

class LogIn extends GetView<LoginController> {

  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage('lib/images/gradientBackground.png'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: 
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image(image: AssetImage('lib/images/trailerlogo_white-01.png'), width: width*0.5),
               SizedBox(height: 20),
               SignInButton( Buttons.Google, 
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                padding: EdgeInsets.all(8),
                onPressed: () {
                  controller.login();
                } 
              ),
              SizedBox(height: 50),
             ],
           ),
        ),
      ),
    );
  }
}