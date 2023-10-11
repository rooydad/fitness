import 'package:fitnass/screens/register/components/background_img.dart';
import 'package:fitnass/screens/register/components/circle_button.dart';
import 'package:fitnass/screens/register/components/signup_credentials.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackgroundImg(),
                SignUpCredentials(),
              ],
            ),
            CircleButtonReg(),
          ],
        ),
      ),
    );
  }
}
