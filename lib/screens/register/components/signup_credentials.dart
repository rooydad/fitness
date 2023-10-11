import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/login/login_screen.dart';
import 'package:fitnass/screens/register/components/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpCredentials extends StatelessWidget {
  SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           Text(
            key:controller.key1,
            'لطفا ثبت نام کنید',
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
              controller: controller.nameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
                fillColor: white,
                hintText: 'نام',
                suffixIcon: Icon(
                  Icons.person_outline,
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
              controller: controller.emailController,
              
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
                fillColor: Colors.white,
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
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
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
          GestureDetector(
            onTap: (){Get.to(()=>LoginScreen());},
            child: Center(
              child: RichText(
                textDirection: TextDirection.rtl,
                textScaleFactor: 1,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style.copyWith(color: Colors.blue),
                  text: 'حساب کاربری دارید؟',
                  children: [
                    TextSpan(text: 'وارد شوید!',style: TextStyle(color: Colors.purple))
                  ]
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          InkWell(
            onTap: () {
              controller.DoSignUp();
            },
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
                    'ثبت نام',
                    style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
