import 'package:fitnass/screens/splash/components/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:Lottie.asset('assets/images/splash.json'),
          ),

          Text('بهترین نسخه از خودت در 30 روز!',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20),),
          SizedBox(
            height: 30,
          ),
         CircularProgressIndicator(color: Colors.orange,),
        ],
      ),
    );
  }
}