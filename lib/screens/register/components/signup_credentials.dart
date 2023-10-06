import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpCredentials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
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
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
                fillColor: white,
                hintText: 'نام کاربری',
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
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
                fillColor: Colors.white,
                hintText: 'ایمیل',
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
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
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
          Center(
            child: Text(
              'ورود به برنامه ',
              style: TextStyle(
                fontSize: 18,
                color: black.withOpacity(0.4),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
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
