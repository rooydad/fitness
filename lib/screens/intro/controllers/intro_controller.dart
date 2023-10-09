import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';

class IntroController extends GetxController{
  List<ContentConfig> listContentConfig = [];
  @override
  void onInit() {
    set_pages();
    super.onInit();
  }
  void set_pages()async{
    listContentConfig.add(
      const ContentConfig(
        textAlignDescription: TextAlign.center,
        title: "تو خونه تمرین کن",
        description:
            "میخوای تو خونه تمرین کنی؟\nوقت باشگاه رفتن نداری؟\nخوب جایی اومدی!",
        pathImage: "assets/images/pose2.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "فروشگاه",
        description:
            "میتونی همه لوازم تمرین توی خونه رو از همینجا با تخفیف خریداری کنی و از ورزش در خونه لذت ببری",
        pathImage: "assets/images/pose1.png",
        backgroundColor: Color(0xff203152),
      ),
    );

        listContentConfig.add(
      const ContentConfig(
        title: "مشاوره رایگان",
        description:
           "میتونی از اساتید برجسته ورزشی مشاوره و برنامه رایگان بگیری و اصولی تمرین کنی",
        pathImage: "assets/images/pose3.png",
        backgroundColor: Colors.green,
      ),
    );
  }


}