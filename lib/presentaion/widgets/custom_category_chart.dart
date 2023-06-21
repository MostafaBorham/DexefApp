import 'package:auto_size_text/auto_size_text.dart';
import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:dexef_task/presentaion/ui_resources/app_sizes.dart';
import 'package:dexef_task/presentaion/ui_resources/app_styles.dart';
import 'package:flutter/material.dart';

class NumericalCategoryChart extends StatefulWidget {
  const NumericalCategoryChart(
      {Key? key,
      this.backgroundColor,
      this.data,
      this.chartHeight,
      this.yMaxValue})
      : super(key: key);

  final Color? backgroundColor;
  final double? chartHeight;
  final List<NumericalChartData>? data;
  final int? yMaxValue;

  @override
  State<NumericalCategoryChart> createState() => _NumericalCategoryChartState();
}

class _NumericalCategoryChartState extends State<NumericalCategoryChart> {
  late double? stepLength;
  late NumericalChartData? maxData;
  bool _isAnimated = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        setState(() {
          _isAnimated = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //data!.descendSort();
    maxData = widget.data!.getMax();
    stepLength = widget.chartHeight! / widget.yMaxValue!;
    return Container(
      height: widget.chartHeight,
      width: AppWidth.s305,
      alignment: AlignmentDirectional.bottomCenter,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: AppHeight.s16,
                child: AutoSizeText(widget.yMaxValue.toString(),
                    style: AppStyles.getDexefStyle(
                        fontSize: 12, color: AppColors.midGrey)),
              ),
              SizedBox(
                height: (widget.chartHeight! -
                        AppHeight.s30 -
                        (3 * AppHeight.s16)) /
                    2,
              ),
              SizedBox(
                height: AppHeight.s16,
                child: AutoSizeText((widget.yMaxValue! / 2.0).toString(),
                    style: AppStyles.getDexefStyle(
                        fontSize: 12, color: AppColors.midGrey)),
              ),
              SizedBox(
                height: (widget.chartHeight! -
                        AppHeight.s30 -
                        (3 * AppHeight.s16)) /
                    2,
              ),
              SizedBox(
                height: AppHeight.s16,
                child: AutoSizeText('0',
                    style: AppStyles.getDexefStyle(
                        fontSize: 12, color: AppColors.midGrey)),
              ),
              SizedBox(
                height: AppHeight.s30,
              )
            ],
          ),
          SizedBox(
            width: AppWidth.s15,
          ),
          SizedBox(
            width: AppWidth.s250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.data!.map<Widget>((singleNumericalData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      curve: Curves.fastOutSlowIn,
                      width: AppWidth.s22,
                      height: !_isAnimated
                          ? 0
                          : (singleNumericalData.yValue! > widget.yMaxValue!)
                              ? widget.yMaxValue! * stepLength!
                              : singleNumericalData.yValue! * stepLength!,
                      decoration: BoxDecoration(
                        color: singleNumericalData.yValue == maxData!.yValue
                            ? AppColors.orange
                            : AppColors.midBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.s20,
                    ),
                    AutoSizeText(
                      singleNumericalData.xValue!,
                      style: AppStyles.getInterStyle(
                          fontSize: 12, color: AppColors.black),
                    ),
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class NumericalChartData {
  final int? yValue;
  final String? xValue;

  NumericalChartData({this.yValue, this.xValue});
}

extension NumericalChartDataList on List<NumericalChartData> {
  List<NumericalChartData> descendSort() {
    for (int i = 0; i < length - 1; i++) {
      for (int j = i + 1; j < length; j++) {
        if (this[j].yValue! > this[i].yValue!) {
          final tmp = this[j];
          this[j] = this[i];
          this[i] = tmp;
        }
      }
    }
    return this;
  }

  NumericalChartData getMax() {
    NumericalChartData max = first;
    for (NumericalChartData chartData in this) {
      if (chartData.yValue! > max.yValue!) {
        max = chartData;
      }
    }
    return max;
  }
}
