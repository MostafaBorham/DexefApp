import 'package:dartz/dartz.dart';
import 'package:dexef_task/core/app_errors/failures.dart';
import 'package:dexef_task/domain/entities/user_auth.dart';
import 'package:dexef_task/domain/entities/user_verification.dart';
import 'package:dexef_task/domain/repositories/base_repository.dart';
import 'package:flutter/material.dart';

class AuthUseCase {
  final BaseRepository? baseRepo;

  AuthUseCase({this.baseRepo});

  Future<Either<Failure, UserVerification>> call({UserAuth? userAuthData}) async {
    debugPrint('use case');
    return await baseRepo!.auth(userAuthData: userAuthData);
  }
}