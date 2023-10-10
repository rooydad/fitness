import 'dart:convert';
import 'package:get/get.dart';
import 'package:fitnass/constants/const.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';


class ShopController extends GetxController{
RxList Products = [].obs;
RxString cart_count = '-'.obs;
@override
  void onInit() {
    fetch_data().then((value){
      Products.clear();
      Products.addAll(value);
    });
    fetchMyCart().then((value1){
      cart_count.value = value1.length.toString();
    });
    super.onInit();
  }

  Future<List> fetch_data()async{
    final url = mainAddress + get_shop;
    var request = await http.get(Uri.parse(url));
    if(request.statusCode==200){
      List result = List<Map<String, dynamic>>.from(json.decode(request.body));
      return result;
    }else{
      Get.snackbar("خطا", "مشکل در ارتباط با سرور");
      return [];
    }
  }

  Future<List>fetchMyCart()async{
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
  }

