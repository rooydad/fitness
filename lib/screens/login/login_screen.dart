import 'package:fitnass/screens/login/components/background_image_clipper.dart';
import 'package:fitnass/screens/login/components/components/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/screens/login/components/circle_button.dart';
import '/screens/login/components/login_credentials.dart';


class LoginScreen extends StatelessWidget {

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
                BackgroundImage(),
                LoginCredentials(),

              ],
            ),
            CircleButton(),
          ],
        ),
      ),
    );
  }
}
