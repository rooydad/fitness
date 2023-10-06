import 'dart:convert';

import 'package:get/get.dart';
import 'package:fitnass/const.dart';
import 'package:http/http.dart' as http;

class BiggenerController extends GetxController {
  @override
  void onInit() {
    fetch_data().then((value) {
      data.clear();
      data.addAll(value);
    });
    super.onInit();
  }

  RxList data = [].obs;

  Future<List> fetch_data() async {
    final url = get_biggeners;
    var request = await http.get(Uri.parse(url));
    if (request.statusCode == 200) {
      List result = List<Map<String, dynamic>>.from(json.decode(request.body));
      return result;
    } else {
      return [];
    }
  }
}
