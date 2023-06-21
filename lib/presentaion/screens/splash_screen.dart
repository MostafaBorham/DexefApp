import 'package:dexef_task/presentaion/ui_resources/app_assets.dart';
import 'package:dexef_task/presentaion/ui_resources/app_sizes.dart';
import 'package:dexef_task/core/app_routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute);
    },);
  }
  @override
  Widget build(BuildContext context) {
    ///init Device Screen Height & Width from Splash to use in whole app
    AppSizes.appHeight=MediaQuery.of(context).size.height;
    AppSizes.appWidth=MediaQuery.of(context).size.width;
    ///
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppAssets.splashImage,fit: BoxFit.cover),
      ),
    );
  }
}
