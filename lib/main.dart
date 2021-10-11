   
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/route/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trailer/views/splash.dart';
import 'package:trailer/views/login.dart';
import 'package:trailer/bindings/home_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HomeBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LittleDrops',
      theme: ThemeData(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
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