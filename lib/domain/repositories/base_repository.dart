import 'package:dartz/dartz.dart';
import 'package:dexef_task/core/app_errors/failures.dart';
import 'package:dexef_task/domain/entities/user_auth.dart';
import 'package:dexef_task/domain/entities/user_verification.dart';

abstract class BaseRepository {
  Future<Either<Failure, UserVerification>> auth({UserAuth? userAuthData});
}
