import 'dart:convert';
import 'package:fitnass/constants/const.dart';
import 'package:fitnass/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  TextEditingController address_controller = TextEditingController();
  RxList cartList = [].obs;
  RxInt totalPrice = 0.obs;
  @override
  void onInit() {
    fetch_data().then((value){
      cartList.clear();
      cartList.addAll(value);
    });
    fetchPrice();
    super.onInit();
  }

  Future<List> fetch_data() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String user_email = prefs.getString("email")!;
    final url = mainAddress + get_carts;
    var values = {
      "email": user_email,
    };
    var request = await http.post(Uri.parse(url), body: values);
    if (request.statusCode == 200) {
      List result = List<Map<String, dynamic>>.from(json.decode(request.body));
      return result;
    } else {
      Get.snackbar("خطا", "مشکلی در ارتباط با سرور پیش آمده");
      return [];
    }
  }

  Future<int>fetchPrice()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String user_email = prefs.getString("email")!;
    final url = mainAddress + get_total_price;
    var values = {
      "email":user_email,
    };
    var request = await http.post(Uri.parse(url),body: values);
    if(request.statusCode==200){
     return totalPrice.value =int.parse(request.body.toString());
    }else{
      Get.snackbar("خطا", "خطا در ارتباط با سرور");
      return 0;
    }

  }

  void ShowFinalDialog()async{
    Get.defaultDialog(
      title: "خرید نهایی",
      content: Column(
        children: [
                   Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              controller: address_controller,
              maxLines: 5,
              minLines: 4,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding:  EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
                fillColor: white,
                hintText: 'آدرس دقیق',
                suffixIcon: Icon(
                  Icons.person_outline,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
