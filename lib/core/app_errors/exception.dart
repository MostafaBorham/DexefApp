abstract class BaseException implements Exception {
  final String? errorMessage;

  BaseException({this.errorMessage});
}

class ServerException extends BaseException {
  ServerException({String? errorMessage}) : super(errorMessage: errorMessage);
}

class OfflineException extends BaseException {
  OfflineException({String? errorMessage}) : super(errorMessage: errorMessage);
}
