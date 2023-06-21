import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:dexef_task/presentaion/ui_resources/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key, this.color=AppColors.white}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppWidth.s22,
        height: AppWidth.s22,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
