import 'dart:convert';

import 'package:fitnass/constants/const.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class SeeAllController extends GetxController{
  RxList data = [].obs;

  @override
  void onInit() {
    check();
    super.onInit();
  }

  Future<List>fetch_Data(String params)async{
    final url = mainAddress + get_all;
    var values = {
      "param":params
    };
  var request = await http.post(Uri.parse(url),body: values);
  if(request.statusCode==200){
    List result = List<Map<String, dynamic>>.from(json.decode(request.body));
    return result;
  }else{
    Get.snackbar('خطا', "خطا در ارتباط با سرور");
    return [];
  }
  }

  void check()async{
            SharedPreferences _prefs = await SharedPreferences.getInstance();
            final SharedPreferences prefs = await _prefs;
            String params = prefs.getString("params")!;
            fetch_Data(params).then((value){
              data.clear();
              data.addAll(value);
            });
  }
}