import 'dart:convert';

import 'package:fitnass/constants/const.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class CoursesController extends GetxController{
  RxList courses = [].obs;
  @override
  void onInit() {
   fetchData().then((value){
    courses.clear();
    courses.addAll(value);
   });
    super.onInit();
  }

  Future<List>fetchData()async{
    final url = mainAddress + get_special;
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