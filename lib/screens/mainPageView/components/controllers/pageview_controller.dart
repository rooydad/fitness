import 'package:fitnass/screens/category/views/category.dart';
import 'package:fitnass/screens/chat/chat_page.dart';
import 'package:fitnass/screens/home/home_screen.dart';
import 'package:fitnass/screens/product/product_home.dart';
import 'package:fitnass/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  RxInt selsctedIconIndex = 2.obs;

  PageController controllerofPageview = PageController(initialPage: 2);
  List<Widget> Pageslist = <Widget>[
    ChatPage(),
    ShopPage(),
    HomeScreen(),
    CategoryPage(),
    ProfilePage(),
  ];

  void selectedItemChanger(int newindex) {
    selsctedIconIndex.value = newindex;
    controllerofPageview.animateToPage(newindex,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
