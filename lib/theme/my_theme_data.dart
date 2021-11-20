import 'package:flutter/material.dart';

class MyThemeData {
  static final ThemeData LIGHT_THEME = ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        headline4: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ));
}
