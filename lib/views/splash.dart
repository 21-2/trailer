import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trailer/views/login.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget{
  const Splash({Key? key}) : super (key:key);

  @override 
  Widget build(BuildContext context){
    var width = Get.context!.mediaQuerySize.width;
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Image(image: AssetImage('lib/images/trailerlogo.png'), width: width*0.5),
      nextScreen: LogIn(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.white,
      );
  }
}