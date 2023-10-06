import 'dart:convert';

import 'package:fitnass/screens/mainPageView/mainPageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnass/const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void DoLogin() async {
    if (emailcontroller.text.length > 0 && emailcontroller.text.contains('@')) {
      if (passwordcontroller.text.length > 5) {
        final url = mainAddress + login;
        var Values = {
          "email": emailcontroller.text,
          "password": passwordcontroller.text
        };
        var request = await http.post(Uri.parse(url), body: Values);
        if (request.body != "No user found or password incorrect.") {
          Map<String, dynamic> data =
              new Map<String, dynamic>.from(json.decode(request.body));
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          final SharedPreferences prefs = await _prefs;
          await prefs.setString("name", data['name']);
          await prefs.setString("email", data['email']);
          await prefs.setString("profile", data['profile']);
          await prefs.setBool('reged', true);
          Get.off(() => MainPageView());
        } else {
          Get.snackbar('خطا', 'کاربری با این مشخصات یافت نشد');
        }
      } else {
        Get.snackbar('خطا', 'رمز عبور به درستی وارد نشده');
      }
    } else {
      Get.snackbar('خطا', 'ایمیل به درستی وارد نشده');
    }
  }
}
