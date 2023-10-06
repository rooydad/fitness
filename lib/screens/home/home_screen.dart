import 'package:fitnass/screens/home/components/controllers.dart/appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/constants.dart';
import '/screens/home/components/courses.dart';
import '/screens/home/components/custom_app_bar.dart';
import '/screens/home/components/diff_styles.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(top: appPadding * 2),
        child: 
           Column(
            children: [
              CustomAppBar(),
              DiffStyles(),
              Courses(),
            ],
          ),
        
      ),
    );
  }
}
