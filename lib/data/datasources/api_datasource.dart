import 'package:dexef_task/core/app_connection/connection_checker.dart';
import 'package:dexef_task/core/app_errors/errors.dart';
import 'package:dexef_task/core/app_errors/exception.dart';
import 'package:dexef_task/data/datasources/base_datasource.dart';
import 'package:dexef_task/data/models/user_auth_model.dart';
import 'package:dexef_task/data/models/user_verification_model.dart';
import 'package:dexef_task/data/network_resources/constants.dart';
import 'package:dexef_task/data/network_resources/dio_helper.dart';

class ApiDataSource extends BaseDataSource {
  @override
  Future<UserVerificationModel> auth({UserAuthModel? userAuthDataModel}) async {
    if (await ConnectionChecker.isConnected) {
      final response = await DioHelper.getData(
          endPoint: NetworkConstants.getUsersDataEndpoint,
          params: userAuthDataModel?.toJson());

      /// If in case Server Failure should return error message as String, else return Map of response
      if (response.data.runtimeType == String) {
        throw ServerException(errorMessage: AppErrors.serverErrorMessage);
      } else {
        return UserVerificationModel.fromJson(response.data['Verification'][0]);
      }
    } else {
      throw OfflineException(errorMessage: AppErrors.offlineErrorMessage);
    }
  }
}
