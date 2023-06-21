import 'package:dexef_task/app_initialization.dart';
import 'package:dexef_task/core/app_services/dependency_injector.dart';
import 'package:dexef_task/data/network_resources/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjector.init();
  DioHelper.init();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const DexefApp()));
}
