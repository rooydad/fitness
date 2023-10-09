import 'package:fitnass/screens/intro/controllers/intro_controller.dart';
import 'package:fitnass/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntroPage extends StatelessWidget {
  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        key: UniqueKey(),
        listContentConfig: controller.listContentConfig,
        renderNextBtn: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
             color: Colors.white,
          ),
         
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text('بعدی'),),
        ),
        renderDoneBtn: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
             color: Colors.white,
          ),
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text('ورود'),),
        ),
        renderSkipBtn: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
             color: Colors.white,
          ),
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text('پرش'),),
        ),
        onDonePress: (){
          Get.to(()=>LoginScreen());
        },
      ),
    );
  }
}