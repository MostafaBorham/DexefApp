import 'package:auto_size_text/auto_size_text.dart';
import 'package:dexef_task/presentaion/ui_resources/app_assets.dart';
import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:dexef_task/presentaion/ui_resources/app_sizes.dart';
import 'package:dexef_task/presentaion/ui_resources/app_strings.dart';
import 'package:dexef_task/presentaion/ui_resources/app_styles.dart';
import 'package:dexef_task/presentaion/widgets/custom_category_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _navBarCurrentIndex = 0;
  final _navBarItems = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.homeIcon),
        activeIcon:
            SvgPicture.asset(AppAssets.homeIcon, color: AppColors.whiteBlue),
        label: AppStrings.homeLabel),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.transactionsIcon),
        activeIcon: SvgPicture.asset(
          AppAssets.transactionsIcon,
          color: AppColors.whiteBlue,
        ),
        label: AppStrings.transactionsLabel),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.reportsIcon),
        activeIcon: SvgPicture.asset(
          AppAssets.reportsIcon,
          color: AppColors.whiteBlue,
        ),
        label: AppStrings.reportsLabel),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.listsIcon),
        activeIcon: SvgPicture.asset(
          AppAssets.listsIcon,
          color: AppColors.whiteBlue,
        ),
        label: AppStrings.listsLabel),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.navSearchIcon),
        activeIcon: SvgPicture.asset(
          AppAssets.navSearchIcon,
          color: AppColors.whiteBlue,
        ),
        label: AppStrings.searchLabel),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      appBar: _buildMainAppBar(),
      body: _navBarCurrentIndex == 0
          ? _buildMainBody()
          : _buildEmptyScreen(
              screenName: _navBarItems[_navBarCurrentIndex].label),
      bottomNavigationBar: _buildMainNavigationBar(),
    );
  }

  Widget _buildMainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: AppHeight.s170,
          ),
          _buildChart(),
          SizedBox(
            height: AppHeight.s60,
          ),
          _buildPercentageBar(),
          SizedBox(
            height: AppHeight.s46,
          ),
          _buildCashAvailView(),
          SizedBox(
            height: AppHeight.s44,
          ),
          _buildCashTransactions(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildMainAppBar() {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      leading: Icon(
        Icons.menu,
        size: AppWidth.s26,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildChart() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        NumericalCategoryChart(
          backgroundColor: AppColors.transparent,
          chartHeight: AppHeight.s253,
          yMaxValue: 500,
          data: [
            NumericalChartData(xValue: 'M', yValue: 130),
            NumericalChartData(xValue: 'T', yValue: 255),
            NumericalChartData(xValue: 'W', yValue: 350),
            NumericalChartData(xValue: 'T', yValue: 190),
            NumericalChartData(xValue: 'F', yValue: 300),
            NumericalChartData(xValue: 'S', yValue: 220),
            NumericalChartData(xValue: 'S', yValue: 190),
          ],
        ),
        SizedBox(
          height: AppHeight.s35,
          width: AppWidth.s165,
          child: Card(
            color: AppColors.white,
            elevation: 5,
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Align(
              alignment: Alignment.center,
              child: AutoSizeText.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: '74 ',
                    style: AppStyles.getInterStyle(
                        fontSize: 16, color: AppColors.black),
                    children: [
                      TextSpan(
                        text: AppStrings.salesInvoice,
                        style: AppStyles.getDexefStyle(
                          fontSize: 12,
                          color: AppColors.black,
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPercentageBar() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: AppWidth.s46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.barPercentage,
            style: AppStyles.getInterStyle(
              fontSize: 18,
              color: AppColors.black,
            ),
          ),
          SizedBox(
            height: AppHeight.s13,
          ),
          Row(
            children: [
              AutoSizeText(
                AppStrings.barTitle,
                style: AppStyles.getDexefStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
              AutoSizeText(
                AppStrings.barSubTitle,
                style: AppStyles.getDexefStyle(
                  fontSize: 12,
                  color: AppColors.violet,
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppHeight.s13,
          ),
          LinearPercentIndicator(
            width: AppWidth.s309,
            alignment: MainAxisAlignment.start,
            animation: true,
            animationDuration: 1000,
            barRadius: const Radius.circular(5),
            padding: EdgeInsets.zero,
            lineHeight: AppHeight.s9,
            percent: 0.38,
            progressColor: AppColors.whiteBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildCashAvailView() {
    return Container(
      height: AppHeight.s81,
      width: AppWidth.s375,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppWidth.s18),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          color: AppColors.whiteBlue, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                AppStrings.cashAvailTitle1,
                style: AppStyles.getDexefStyle(
                  fontSize: 22,
                  color: AppColors.white,
                ),
              ),
              AutoSizeText(
                AppStrings.cashAvailTitle2,
                style: AppStyles.getDexefStyle(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          AutoSizeText(
            '30,000.75',
            style:
                AppStyles.getDexefStyle(color: AppColors.white, fontSize: 35),
          )
        ],
      ),
    );
  }

  Widget _buildCashTransactions() {
    return Padding(
      padding:
          EdgeInsetsDirectional.only(start: AppWidth.s15, bottom: AppHeight.s3),
      child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: AutoSizeText(
            AppStrings.cashTransactionsTitle,
            style: AppStyles.getInterStyle(
                color: AppColors.darkBlue, fontSize: 20),
          )),
    );
  }

  Widget _buildEmptyScreen({String? screenName = ''}) {
    return Center(
        child: AutoSizeText(
      screenName!,
      style: AppStyles.getInterStyle(color: AppColors.darkBlue, fontSize: 30),
    ));
  }

  Widget _buildMainNavigationBar() {
    return BottomNavigationBar(
      items: _navBarItems,
      selectedItemColor: AppColors.whiteBlue,
      unselectedItemColor: AppColors.darkBlue,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _navBarCurrentIndex = index;
        });
      },
      elevation: 5,
      currentIndex: _navBarCurrentIndex,
      unselectedLabelStyle: AppStyles.getDexefStyle(
        fontSize: 12,
      ),
      selectedLabelStyle: AppStyles.getDexefStyle(fontSize: 12),
      showUnselectedLabels: true,
    );
  }
}
