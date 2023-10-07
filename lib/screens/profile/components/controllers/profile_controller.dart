import 'package:fitnass/main.dart';
import 'package:fitnass/screens/splash/splashscreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:fitnass/constants/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxString ImagePath = ''.obs;
  @override
  void onInit() {
    setItems();
    super.onInit();
  }
  void setItems() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    email.value = prefs.getString("email")!;
    name.value = prefs.getString("name")!;
    ImagePath.value = prefs.getString("profile")!;
  }

  void handle_permission() async {
    print('no');
    var status = await Permission.accessMediaLocation.status;
    print(status.toString());
    if (status.isGranted) {
      pickImage();
    }
    if (status.isDenied) {
      Permission.accessMediaLocation.request().then((value) {
        if (value.isGranted) {
          pickImage();
        }
      });
    }
    if (status.isRestricted) {
      Permission.accessMediaLocation.request().then((value) {
        if (value.isGranted) {
          pickImage();
        }
      });
    }
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String email = prefs.getString('email')!;
    if (image != null) {
      uploadImage(image, email).then((value) {
        if (value == "Done") {
          //Get.off(() => SplashPage());
        } else {
          Get.snackbar("خطا", "مشکلی پیش آمده است دوباره تلاش کنید");
        }
      });
    }
  }

  Future<String> uploadImage(XFile image, String email) async {
    final url = Uri.parse(mainAddress + update_profile); // آدرس فایل PHP
    final request = http.MultipartRequest('POST', url);

    // اضافه کردن عکس به درخواست Multipart
    final imageFile = await http.MultipartFile.fromPath('image', image.path,
        contentType:
            MediaType('image', 'jpeg')); // در اینجا باید نوع عکس را تطابق دهید

    request.files.add(imageFile);

    // اضافه کردن ایمیل به درخواست
    request.fields['email'] = email;

    // ارسال درخواست و دریافت پاسخ
    final response = await request.send();

    if (response.statusCode == 200) {
      ImagePath.value = "/uploads/" + imageFile.filename!;
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      await prefs.setString("profile", ImagePath.value);
      return "Done";
    } else {
      return "Failed";
    }
  }
}
