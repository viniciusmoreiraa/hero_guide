import 'package:flutter/material.dart';

class ThemneCustom {
  static Color lightPrimary = Color(0xff1d1d1d);
  static Color darkPrimary = Color(0xff1f1f1f);
  static Color lightAccent = Color(0xff03d9c7);
  static Color darkAccent = Color(0xff03d9c7);
  static Color lightBG = Color(0xff121212);
  static Color darkBG = Color(0xff121212);
  static Color textColorTitle = Color(0xff03d9c7);
  static Color iconDark = Color(0xffffffff);
  static Color errorColor = Color(0xffff0000);
  static Color selectedRowColor = Color(0xff00ff00);
  static TextTheme textThemedark = TextTheme(
    headline5: TextStyle(fontSize: 20),
    headline6: TextStyle(color: textColorTitle),
    caption: TextStyle(color: iconDark),
    subtitle2: TextStyle(color: iconDark),
  );

  static ThemeData lightTheme = ThemeData(
    selectedRowColor: selectedRowColor,
    errorColor: errorColor,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      // toolbarTextStyle: TextStyle(color: textColorTitle),
    ),
    textTheme: textThemedark,
    iconTheme: IconThemeData(color: iconDark),
  );

  static ThemeData darkTheme = ThemeData(
    selectedRowColor: selectedRowColor,
    errorColor: errorColor,
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(elevation: 0),
    textTheme: textThemedark,
    iconTheme: IconThemeData(color: iconDark),
  );
}
