part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

///Auth States
class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccessState extends AuthState {
  final UserVerification? userVerificationData;
  const AuthSuccessState({this.userVerificationData});
  @override
  List<Object?> get props => [userVerificationData];
}

class AuthFailedState extends AuthState {
  final String? failureMessage;
  const AuthFailedState({this.failureMessage});
  @override
  List<Object?> get props => [failureMessage];
}