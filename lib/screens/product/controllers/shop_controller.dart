import 'dart:convert';

import 'package:get/get.dart';
import 'package:fitnass/constants/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


class ShopController extends GetxController{
RxList Products = [].obs;
@override
  void onInit() {
    fetch_data().then((value){
      Products.clear();
      Products.addAll(value);
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

}