import 'dart:convert';

import 'package:fitnass/constants/const.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AnswerController extends GetxController {
  @override
  void onInit() {
    fetch_data().then((value){
      messages.clear();
      messages.addAll(value);
    });
    super.onInit();
  }
  RxList messages = [].obs;


  Future<List> fetch_data() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String email = prefs.getString("email")!;
    final url = mainAddress + get_answers;
    var Values = {"email": email};
    var request = await http.post(Uri.parse(url), body: Values);
    if (request.statusCode == 200) {
      List result = List<Map<String, dynamic>>.from(json.decode(request.body));
      return result;
    } else {
      Get.snackbar("خطا", "خطا در ارتباط با سرور");
      return [];
    }
  }
}
