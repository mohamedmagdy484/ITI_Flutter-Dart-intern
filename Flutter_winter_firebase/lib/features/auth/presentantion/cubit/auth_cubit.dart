import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/auth/domain/entities/auth_request_entity.dart';
import 'package:flutter_winter_firebase/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_winter_firebase/features/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase, this._registerUseCase)
    : super(AuthInitialState());
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  Future<void> login(String username, String password) async {
    emit(AuthLoadingState());
    Result<UserCredential> result = await _loginUseCase(
      AuthRequestEntity(email: username, password: password),
    );
    if (result is Success) {
      emit(AuthSuccessState((result as Success).data));
    } else if (result is Failure) {
      emit(
        AuthFailureState((result as Failure).error ?? 'Something went wrong'),
      );
    }
  }

  void register(String username, String password) async {
    emit(AuthLoadingState());
    Result<UserCredential> result = await _registerUseCase(
      AuthRequestEntity(email: username, password: password),
    );
    if (result is Success) {
      emit(AuthSuccessState((result as Success).data));
    } else if (result is Failure) {
      emit(
        AuthFailureState((result as Failure).error ?? 'Something went wrong'),
      );
    }
  }
}
