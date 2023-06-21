import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle getDexefStyle(
      {double fontSize = 15,
      Color color = AppColors.whiteBlue,
      TextDecoration textDecoration = TextDecoration.none,}) {
    return TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color,);
  }
  static TextStyle getInterStyle(
      {double fontSize = 15,
        Color color = AppColors.white,
        TextDecoration textDecoration = TextDecoration.none,}) {
    return TextStyle(
      fontSize: fontSize,
      decoration: textDecoration,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: color,);
  }
}
