
import 'package:dexef_task/data/models/user_auth_model.dart';
import 'package:dexef_task/data/models/user_verification_model.dart';

abstract class BaseDataSource {
  Future<UserVerificationModel> auth({UserAuthModel? userAuthDataModel});
}