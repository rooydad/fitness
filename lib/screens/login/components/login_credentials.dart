import 'package:fitnass/screens/login/components/components/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/constants.dart';
import '/screens/home/home_screen.dart';



class LoginCredentials extends StatelessWidget {
    LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'لطفا وارد شوید',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              controller: controller.emailcontroller,
              decoration: InputDecoration(
                border:
                const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: white,
                hintText: 'ایمیل',
                suffixIcon: Icon(
                  Icons.email_outlined,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              controller: controller.passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                border:
                const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: Colors.white,
                hintText: 'رمز عبور',
                suffixIcon: Icon(
                  Icons.lock_outline,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Center(
            child: Text(
              'ایجاد حساب کاربری جدید',
              style: TextStyle(
                  fontSize: 18, color: black.withOpacity(0.4),),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          InkWell(
            onTap: () {controller.DoLogin();},
            child: Material(
                elevation: 10.0,
                shadowColor: primary,
                color: primary,
                borderRadius: BorderRadius.circular(30.0),
                child: SizedBox(
                  width: size.width,
                  height: size.width * 0.15,
                  child: const Center(
                    child: Text(
                      'ورود به برنامه',
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
