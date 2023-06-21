import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:dexef_task/presentaion/ui_resources/app_sizes.dart';
import 'package:dexef_task/presentaion/ui_resources/app_styles.dart';
import 'package:flutter/material.dart';

class UserInputText extends StatelessWidget {
  const UserInputText({Key? key, this.controller, this.hintText='', this.inputType}) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.s355,
      height: AppHeight.s44,
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        keyboardType: inputType,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.only(start: AppWidth.s25,end: AppWidth.s25),
          hintText: hintText,
          hintStyle: AppStyles.getDexefStyle(color: AppColors.darkGrey,),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.whiteBlue,width: 0.5,)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppColors.whiteBlue,style: BorderStyle.solid,width: 0.5,)
          ),
        ),
      ),
    );
  }
}
