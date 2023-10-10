import 'package:fitnass/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class DetailController extends GetxController {
  void addToMyCart(
      String email, String name, String price, String url_pic) async {
    final url = mainAddress + add_cart;
    var values = {
      "email": email,
      "price": price,
      "url": url_pic,
      "name": name,
    };
    var request = await http.post(Uri.parse(url), body: values);
    if (request.statusCode == 200) {
      Get.defaultDialog(
          title: "افزودن به سبد خرید",
          content: Column(
            children: [
              Lottie.asset("assets/images/done.json"),
              SizedBox(
                height: 7,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back(closeOverlays: true);
                },
                 child: Text('باشه'),
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                 ),
            ],
          ));
    } else {
      Get.snackbar("خطا", "خطا در افزودن به سبد خرید");
    }
  }
}
