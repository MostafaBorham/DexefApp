class Failure {
  final String? message;

  Failure({this.message});
}

class ServerFailure extends Failure {
  ServerFailure({String? message}) : super(message: message);
}

class OfflineFailure extends Failure {
  OfflineFailure({String? message}) : super(message: message);
}
