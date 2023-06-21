import 'package:dexef_task/core/app_routes/router.dart';
import 'package:dexef_task/core/app_routes/routes.dart';
import 'package:dexef_task/core/app_services/dependency_injector.dart';
import 'package:dexef_task/presentaion/managers/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentaion/ui_resources/app_strings.dart';
import 'presentaion/ui_resources/app_themes.dart';

class DexefApp extends StatelessWidget {
  const DexefApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>DependencyInjector.dihInstance<AuthCubit>()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.getLightTheme(),
        darkTheme: AppThemes.getDarkTheme(),
        themeMode: ThemeMode.light,
        onGenerateRoute: onGenerateRoute,
        initialRoute: AppRoutes.splashScreenRoute,
      ),
    );
  }
}
