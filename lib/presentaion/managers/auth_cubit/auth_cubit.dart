import 'package:dexef_task/core/app_services/dependency_injector.dart';
import 'package:dexef_task/domain/entities/user_auth.dart';
import 'package:dexef_task/domain/entities/user_verification.dart';
import 'package:dexef_task/domain/usecases/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final authUseCase = DependencyInjector.dihInstance<AuthUseCase>();
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  authUser({UserAuth? userAuthData}) async {
    emit(AuthLoadingState());
    final result = await authUseCase(userAuthData: userAuthData);
    result.fold((failure) {
      debugPrint('cubit failure');
      debugPrint(failure.message);
      emit(AuthFailedState(failureMessage: failure.message));
    }, (userVerificationData) {
      debugPrint('cubit success');
      emit(AuthSuccessState(userVerificationData: userVerificationData));
    });
  }
}
