import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/register/components/curve_clipper.dart';
import 'package:flutter/material.dart';

class BackgroundImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CurveClipperReg(),
      child: Container(
        height: size.height * 0.55,
        color: blueGrey.withOpacity(0.8),
        child: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: appPadding / 2,
              vertical: appPadding * 3),
          child: Center(
            child: Image(
              image: AssetImage('assets/images/signup.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}