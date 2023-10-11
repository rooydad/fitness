import 'dart:convert';
import 'package:fitnass/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MoreController extends GetxController {
  @override
  void onInit() {
    setEveryThing();
    super.onInit();
  }

  TextEditingController Dor_Kamar_Controller = TextEditingController();
  TextEditingController Dor_Sineh_Controller = TextEditingController();
  TextEditingController Dor_Basan_Controller = TextEditingController();
  TextEditingController Dor_Bazo_Controller = TextEditingController();
  TextEditingController Dor_Ran_Controller = TextEditingController();
  TextEditingController Weight_Controller = TextEditingController();
  TextEditingController Height_Controller = TextEditingController();
  TextEditingController Special_Problem_Controller = TextEditingController();
  TextEditingController Sport_History_Controller = TextEditingController();

  void setEveryThing() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String user_email = prefs.getString("email")!;
    final url = mainAddress + get_all;
    var values = {"email": user_email};
    var request = await http.post(Uri.parse(url), body: values);
    Map<String, dynamic> data =
        new Map<String, dynamic>.from(json.decode(request.body));

    Dor_Kamar_Controller.text = data['Dor_Kamar'];
    Dor_Sineh_Controller.text = data['Dor_Sineh'];
    Dor_Basan_Controller.text = data['Dor_Basan'];
    Dor_Basan_Controller.text = data['Dor_Kamar'];
    Dor_Bazo_Controller.text = data['Dor_Bazo'];
    Dor_Ran_Controller.text = data['Dor_Ran'];
    Weight_Controller.text = data['Weight'];
    Height_Controller.text = data['Height'];
    Special_Problem_Controller.text = data['Special_Problem'];
    Sport_History_Controller.text = data['Sport_History'];
  }

  void updater() async {
    final url = mainAddress + completer;
        SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String user_email = prefs.getString("email")!;
    var values = {
      "Dor_Sine": Dor_Sineh_Controller.text,
      "Dor_Basan": Dor_Basan_Controller.text,
      "Dor_Bazo": Dor_Bazo_Controller.text,
      "Dor_Kamar": Dor_Kamar_Controller.text,
      "Dor_Ran": Dor_Ran_Controller.text,
      "Weight": Weight_Controller.text,
      "Height": Height_Controller.text,
      "Special_Problem": Special_Problem_Controller.text,
      "Sport_History": Sport_History_Controller.text,
      "email":user_email,
    };
    var request = await http.post(Uri.parse(url),body: values);
    if(request.body=="Done"){
            Get.defaultDialog(
          title: "باموفقیت به روز شد",
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
    }
  }
}
