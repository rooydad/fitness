import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/screens/home/components/courses.dart';
import '/screens/home/components/custom_app_bar.dart';
import '/screens/home/components/diff_styles.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
         padding: const EdgeInsets.only(top:appPadding * 2),
         child: Column(
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
