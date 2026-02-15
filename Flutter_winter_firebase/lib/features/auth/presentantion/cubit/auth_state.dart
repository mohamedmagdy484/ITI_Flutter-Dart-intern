import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserCredential userCredential;

  AuthSuccessState(this.userCredential);
}

class AuthFailureState extends AuthState {
  final String error;

  AuthFailureState(this.error);
}
