import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/app_colors.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      backgroundColor: backgroundColor,
      buttonColor: primaryColor,
      primaryColor: primaryColor,
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 42,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      backgroundColor: Colors.white,
      buttonColor: primaryColor,
      primaryColor: primaryColor,
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 42,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
    );
  }
}
