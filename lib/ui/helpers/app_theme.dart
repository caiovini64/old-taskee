import 'package:flutter/material.dart';

ThemeData buildTheme() {
  const primaryColor = Color(0xff755FE2);
  const primaryColorDark = Color(0xff393D69);
  const backgroundColor = Color(0xff2A3C44);
  const secondaryColor = Color(0xffFF565E);
  const cardColor = Color(0xff00A88B);
  const accentColor = Color(0xff224957);

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    buttonColor: primaryColor,
    backgroundColor: backgroundColor,
    accentColor: primaryColor,
    cardColor: secondaryColor,
    scaffoldBackgroundColor: primaryColor,
    highlightColor: cardColor,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 42,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        )),
  );
}
