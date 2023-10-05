import 'package:flutter/material.dart';
import '/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'yekan',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //Hello How are you
      home: LoginScreen(),
    );
  }
}
