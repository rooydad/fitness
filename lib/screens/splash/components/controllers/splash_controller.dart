import 'package:fitnass/screens/home/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    timer();
    super.onInit();
  }

  void timer() {
    new Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => HomeScreen());
    });
  }
}
