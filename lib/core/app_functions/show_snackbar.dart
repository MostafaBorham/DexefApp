import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:flutter/material.dart';

void showNormalSnackBar({BuildContext? context, String? message}) {
  ScaffoldMessenger.of(context!)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message!),),);
}
void showSuccessSnackBar({BuildContext? context, String? message}) {
  ScaffoldMessenger.of(context!)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message!),backgroundColor: AppColors.success,),);
}

void showErrorSnackBar({BuildContext? context, String? message}) {
  ScaffoldMessenger.of(context!)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message!),backgroundColor: AppColors.error,),);
}