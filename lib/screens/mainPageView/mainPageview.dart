import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/mainPageView/components/controllers/pageview_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MainPageView extends StatefulWidget {
  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  PageViewController controller = Get.put(PageViewController());





  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        body: PageView(
          onPageChanged: (index) => controller.onViewChange(index),
          controller: controller.controllerofPageview,


          children: controller.Pageslist,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,

          index: controller.selsctedIconIndex.value,
          buttonBackgroundColor: primary,
          height: 75.0,
          color: white,
          onTap: (index) {
            controller.selectedItemChanger(index);
          },
          animationDuration: Duration(
            milliseconds: 200,
          ),
          items: <Widget>[
           FaIcon(FontAwesomeIcons.userNurse,size: 30,),
            Icon(
              Icons.shopping_bag,
              size: 30,
              color: controller.selsctedIconIndex == 1 ? white : black,
            ),
            FaIcon(FontAwesomeIcons.house,size: 30,),
            Icon(
              Icons.category,
              size: 30,
              color: controller.selsctedIconIndex == 3 ? white : black,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: controller.selsctedIconIndex == 4 ? white : black,
            ),
          ],
        ),
      ),
    );
  }
}
