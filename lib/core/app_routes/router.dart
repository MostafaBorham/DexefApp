import 'package:dexef_task/presentaion/screens/login_screen.dart';
import 'package:dexef_task/presentaion/screens/main_screen.dart';
import 'package:dexef_task/presentaion/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashScreenRoute:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoutes.loginScreenRoute:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoutes.mainScreenRoute:
      return MaterialPageRoute(builder: (_) => const MainScreen());
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
