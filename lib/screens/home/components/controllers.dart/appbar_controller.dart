import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppbarController extends GetxController {
  @override
  void onInit() {
    setProfile();
    super.onInit();
  }
  RxString name = 'سلام '.obs;
  RxString profile_picture = ''.obs;
  void setProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String usersName = prefs.getString('name')!;
    name.value = name.value + usersName;
    profile_picture.value = await prefs.getString('profile')!;
  }
}
