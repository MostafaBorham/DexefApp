import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes{
  /// Light Mode
  static ThemeData? getLightTheme()=>ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.whiteBlue,
    ),
    scaffoldBackgroundColor: AppColors.white
  );

  /// Dark Mode
  static ThemeData? getDarkTheme()=>ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.darkBlue,
      ),
      scaffoldBackgroundColor: AppColors.black
  );
}