import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme{
  static Color buttonColor = Colors.green;
  static Color whiteColor = const Color(0xffffffff);
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    canvasColor:Colors.white,
    // cardColor: Colors.white,
    colorScheme: ColorScheme(
        primary: Colors.white,
        secondary: Colors.black,
        surface: Colors.cyan.shade50,
        background: Colors.cyan.shade100,
        error: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.light),
  );


  static ThemeData DarkTheme(BuildContext context) => ThemeData(
    canvasColor: Colors.black,
    // cardColor: Colors.black,
    colorScheme: ColorScheme(
        primary: Colors.black12,
        secondary: Colors.white,
        surface: Colors.black12,
        background: Colors.black12,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.red,
        brightness: Brightness.dark),
  );
}