import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.siteBlue,
  cardColor: Colors.white,
  iconTheme: IconThemeData(color: AppColors.siteBlue, size: 25.0),

  // indicatorColor: AppColors.darkGrey,
  // textSelectionHandleColor: AppColors.darkGrey,
  // cardColor: Colors.white,

  // primaryColorLight: Colors.blue,

  // iconTheme: IconThemeData(color: AppColors.newTheme, size: 25.0),

  // Define the default font family.
  fontFamily: 'Lato',
);


class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static const Color success = Colors.green;
  static const Color grey = Colors.grey;
  static const Color black = Colors.black;
  static const Color darkBlue = Colors.blue;

  static const Color themeColor = Color(0xff4285f4);
  static const Color siteBlue = Color(0xff004C98);
  static const Color siteBluelight = Color(0xff1c7cdc);
  // static const Color success = Colors.green;
  // static const Color success = Colors.green;

  static Color lightGrey = Colors.blueGrey;

  static Color textPrimaryColor = siteBlue;
  static Color textSecondaryColor = Colors.red;
  static Color greyColorTemp = Colors.grey;

  static const Color vividCyan = Color(0xff02B8E3);
  static const Color gainsBoro = Color(0xffDDDDDD);
  static const Color darkGrey = Color(0xff333333);
  // static const Color darkBlue = Color(0xff00008b);
  static const Color burntOrange = Color(0xffcc5500);
  static const Color lightYellow = Color(0xFFFFF9C4);
  static const Color white = Color(0xffffffff);
  static const Color red = Color(0xffffcdd2);
  static const Color newTheme = Color(0xff0000fe);
}