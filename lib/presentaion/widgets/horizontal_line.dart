import 'package:dexef_task/presentaion/ui_resources/app_sizes.dart';
import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key, this.color=Colors.black, this.width}) : super(key: key);
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Divider(
        color: color,
        thickness: AppHeight.s2,
      ),
    );
  }
}
