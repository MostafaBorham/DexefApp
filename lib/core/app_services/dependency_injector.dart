import 'package:dexef_task/data/datasources/api_datasource.dart';
import 'package:dexef_task/data/datasources/base_datasource.dart';
import 'package:dexef_task/data/repositories/base_repository_imp.dart';
import 'package:dexef_task/domain/repositories/base_repository.dart';
import 'package:dexef_task/domain/usecases/auth_usecase.dart';
import 'package:dexef_task/presentaion/managers/auth_cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class DependencyInjector {
  static final dihInstance = GetIt.instance;

  static void init() {
    ///Network
    dihInstance.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());

    ///DataSources
    dihInstance.registerLazySingleton<BaseDataSource>(() => ApiDataSource());

    ///Repositories
    dihInstance.registerLazySingleton<BaseRepository>(
        () => BaseRepositoryImp(dataSource: dihInstance()));

    ///UseCases
    dihInstance.registerLazySingleton<AuthUseCase>(
        () => AuthUseCase(baseRepo: dihInstance()));

    ///Cubits
    dihInstance.registerLazySingleton<AuthCubit>(() => AuthCubit());
  }
}
