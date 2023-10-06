// theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static var dark = ThemeData(
      fontFamily: 'yekan',
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.blue, brightness: Brightness.dark));

  static var light = ThemeData(
    fontFamily: 'yekan',
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.indigo,
      accentColor: Colors.black,
    ),
  );
}
