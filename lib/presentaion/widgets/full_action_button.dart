import 'package:auto_size_text/auto_size_text.dart';
import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:dexef_task/presentaion/ui_resources/app_styles.dart';
import 'package:flutter/material.dart';

class FullActionButton extends StatelessWidget {
  const FullActionButton({
    Key? key,
    this.width,
    this.height,
    this.borderRadius=5,
    this.backgroundColor,
    this.foregroundColor=AppColors.white,
    this.text='',
    this.elevation=2,
    this.onPressed,
    this.borderColor = AppColors.transparent,
  }) : super(key: key);
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final String? text;
  final double? elevation;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: elevation,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              // padding: EdgeInsets.symmetric(vertical: verticalPadding),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  // side: BorderSide(color: borderColor)
              ),
              textStyle: AppStyles.getInterStyle()),
          child: AutoSizeText(text!)),
    );
  }
}
