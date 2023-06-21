import 'package:dexef_task/core/app_services/dependency_injector.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker {
  static Future<bool> get isConnected =>
      DependencyInjector.dihInstance<InternetConnectionChecker>().hasConnection;
}
