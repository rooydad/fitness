import 'package:fitnass/screens/mainPageView/mainPageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnass/constants/const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class SignupController extends GetxController {
  @override
  void onInit() {
   addItems();
   Future.delayed(Duration.zero, showTutorial);
    super.onInit();
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey key1 = GlobalKey();
List<TargetFocus> targets = [];
  void DoSignUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String name = nameController.text;
    if (passwordController.text.length > 5) {
      if (emailController.text.length > 0 &&
          emailController.text.contains("@")) {
        if (nameController.text.length > 2) {
          final url = mainAddress + signup;
          var Values = {
            "email": email,
            "password": password,
            "name": name,
          };
          var request = await http.post(Uri.parse(url), body: Values);
          print(request.body);
          if (request.statusCode == 200 && request.body == 'Done') {
            //Done
            SharedPreferences _prefs = await SharedPreferences.getInstance();
            final SharedPreferences prefs = await _prefs;
            await prefs.setString("name", nameController.text);
            await prefs.setString("email", emailController.text);
            await prefs.setString("profile",
                "/uploads/246-2469607_unisex-fitness-illustration-illustration.png");
            await prefs.setBool('reged', true);
            Get.off(() => MainPageView());
          } else {
            if (request.body == "Tekrari") {
              //Tekrari
              Get.snackbar('کاربر تکراری',
                  'کاربری با این ایمیل قبلا در سامانه وجود دارد');
            } else {
              //
              Get.snackbar('خطا', 'خطا در ثبت اطلاعات در سیستم');
            }
          }
        } else {
          Get.snackbar('خطا', 'لطفا نام خود را به شکل صحیح وارد نمایید.');
        }
      } else {
        Get.snackbar('خطا', 'ایمیل به درستی وارد نشده');
      }
    } else {
      Get.snackbar('خطا', 'رمز عبور باید بیشتر از 5 کاراکتر باشد');
    }
  }

void addItems(){
  targets.add(
    TargetFocus(
    identify: "FirstOne",
    keyTarget: key1,
    contents:[ TargetContent(
      align: ContentAlign.right,
      child: Center(child: Text('data'),),),],
  ));
}
  void showTutorial()async{
     TutorialCoachMark tutorial = TutorialCoachMark(targets: targets,
     colorShadow: Colors.blue)..show(context: Get.context!);
  }
}
