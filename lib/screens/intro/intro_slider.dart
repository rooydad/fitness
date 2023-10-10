import 'package:fitnass/screens/intro/controllers/intro_controller.dart';
import 'package:fitnass/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
     listContentConfig.add(
      const ContentConfig(
        title: "ERASER",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "images/photo_eraser.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "PENCIL",
        description: 
            "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/photo_pencil.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    super.initState();
  }
 // IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
         IntroSlider(
          key: UniqueKey(),
          listContentConfig: listContentConfig,
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
      ),
    );
  }
}