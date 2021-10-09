   
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/route/app_pages.dart';
import 'package:trailer/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LittleDrops',
      theme: ThemeData(),
      home: Splash(),
      // home: AnimatedSplashScreen(
      //   splash: Image.asset('images/splash_logo.png'),
      //   splashIconSize: 200,
      //   //nextScreen:DashboardPage(),
      //   nextScreen: LogIn(),
      //   splashTransition: SplashTransition.fadeTransition,
      // ),
    );
  }
}