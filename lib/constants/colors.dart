import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const splashGradient = LinearGradient(
    colors: [
      linearGradiantStartColor, // Start color
      linearGradiantEndColor, // End color
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    transform: GradientRotation(45),
  );
  static const themeColor = Color(0xff002868);
  static const themeRed = Color(0xffbf0a30);

  static const linearGradiantStartColor = themeColor;
  static const linearGradiantEndColor = Colors.white38;

  static const fontColor = Colors.black;
  static const screenBg = Color(0xE5FFFFFF);
}
