import 'package:fitnass/screens/content/conentpage.dart';
import 'package:fitnass/screens/intro/intro_slider.dart';
import 'package:fitnass/screens/mainPageView/mainPageview.dart';
import 'package:fitnass/screens/product/product_home.dart';
import 'package:fitnass/screens/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      darkTheme:  ThemeData.dark().copyWith(primaryColor: Colors.red),
      theme: ThemeData(
        fontFamily: 'yekan',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //Hello How are you
      home: SplashPage(),
    );
  }
}




