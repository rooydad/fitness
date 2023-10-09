import 'package:fitnass/screens/home/home_screen.dart';
import 'package:fitnass/screens/login/login_screen.dart';
import 'package:fitnass/screens/mainPageView/mainPageview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fitnass/constants/const.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    check_sign();
    super.onInit();
  }

  void check_sign() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    if (prefs.containsKey("reged")) {
      update_profile_again();
    } else {
      new Future.delayed(const Duration(seconds: 3), () {
        Get.off(() => IntroSlider());
      });
    }
  }

  void update_profile_again() async {
    final url = mainAddress + get_profile;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String email = await prefs.getString("email")!;
    var Values = {"email": email};
    var request = await http.post(Uri.parse(url), body: Values);
    if (request.statusCode == 200 && request.body != "UserNotFound") {
      if(request.body !="No"){
      await prefs.setString("profile", request.body);
      }
      
      new Future.delayed(const Duration(seconds: 3), () {
        Get.off(() => MainPageView());
      });
    } else {
      Get.snackbar('خطا', "مشکلی روی داده است");
    }
  }
}
