import 'package:dartz/dartz.dart';
import 'package:dexef_task/core/app_errors/exception.dart';
import 'package:dexef_task/core/app_errors/failures.dart';
import 'package:dexef_task/data/datasources/base_datasource.dart';
import 'package:dexef_task/domain/entities/user_auth.dart';
import 'package:dexef_task/domain/entities/user_verification.dart';
import 'package:dexef_task/domain/repositories/base_repository.dart';
import 'package:flutter/material.dart';

class BaseRepositoryImp extends BaseRepository {
  final BaseDataSource? dataSource;

  BaseRepositoryImp({this.dataSource});

  @override
  Future<Either<Failure, UserVerification>> auth(
      {UserAuth? userAuthData}) async {
    try {
      final result =
          await dataSource!.auth(userAuthDataModel: userAuthData!.toModel());
      debugPrint('repo try');
      return Right(result);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(message: ex.errorMessage));
      } else if (ex is OfflineException) {
        return Left(OfflineFailure(message: ex.errorMessage));
      } else {
        debugPrint('repo catch');
        return Left(Failure());
      }
    }
  }
}
