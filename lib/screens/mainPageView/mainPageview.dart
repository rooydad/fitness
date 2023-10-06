import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/mainPageView/components/controllers/pageview_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainPageView extends StatelessWidget {
  PageViewController controller = Get.put(PageViewController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        body: PageView(
          controller: controller.controllerofPageview,
          children: controller.Pageslist,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          index: controller.selsctedIconIndex.value,
          buttonBackgroundColor: primary,
          height: 60.0,
          color: white,
          onTap: (index) {
            controller.selectedItemChanger(index);
          },
          animationDuration: Duration(
            milliseconds: 200,
          ),
          items: <Widget>[
            Icon(
              Icons.play_arrow_outlined,
              size: 30,
              color: controller.selsctedIconIndex == 0 ? white : black,
            ),
            Icon(
              Icons.search,
              size: 30,
              color: controller.selsctedIconIndex == 1 ? white : black,
            ),
            Icon(
              Icons.home_outlined,
              size: 30,
              color: controller.selsctedIconIndex == 2 ? white : black,
            ),
            Icon(
              Icons.favorite_border_outlined,
              size: 30,
              color: controller.selsctedIconIndex == 3 ? white : black,
            ),
            Icon(
              Icons.person_outline,
              size: 30,
              color: controller.selsctedIconIndex == 4 ? white : black,
            ),
          ],
        ),
      ),
    );
  }
}
