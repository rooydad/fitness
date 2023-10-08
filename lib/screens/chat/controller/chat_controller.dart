import 'package:fitnass/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


class ChatController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  void SendMessage() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    if (titleController.text.isNotEmpty) {
      if (messageController.text.isNotEmpty) {
        String email = prefs.getString("email")!;
        String name = prefs.getString("name")!;
        final url = mainAddress + new_tiket;
        var Values = {
          "name":name,
          "sender":email,
          "message":messageController.text.toString(),
          "date":DateTime.now().toPersianDate().toEnglishDigit().toString(),
        };
        var request = await http.post(Uri.parse(url),body: Values);
        print(request.body);
        if(request.body == "Done"&& request.statusCode==200){
            titleController.text = "";
            messageController.text = "";
            Get.snackbar("موفقیت", "کاربر عزیز پیام شما دریافت شد منتظر پاسخ پشتیبان بمانید");
        }else{
          Get.snackbar("خطا", "خطا در ارسال پیام");
        }
      }else{
         Get.snackbar('خطا', "متن تیکت نباید خالی باشد");
      }
    }else{
      Get.snackbar('خطا', "عنوان تیکت نباید خالی باشد");
    }
  }
}
