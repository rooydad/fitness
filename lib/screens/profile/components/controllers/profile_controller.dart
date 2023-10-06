import 'package:fitnass/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  void ChangeAppTheme() {
    var _isLight = Get.theme.brightness == Brightness.light;
    print(_isLight);
    if (_isLight) {
      Get.changeThemeMode(ThemeMode.dark);
     // Get.changeTheme(AppTheme.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
      //Get.changeTheme(AppTheme.light);
    }
  }
}
