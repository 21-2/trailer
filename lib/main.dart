   
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/bindings/dashboard_binding.dart';
import 'package:trailer/bindings/home_binding.dart';

import 'package:trailer/route/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DashboardBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trailer',
      theme: ThemeData(fontFamily: 'SpoqaHans'),
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