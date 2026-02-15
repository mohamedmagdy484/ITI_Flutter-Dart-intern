import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/core/services/firebase_auth_service.dart';
import 'package:flutter_winter_firebase/features/auth/data/model/auth_request_model.dart';

class AuthDataSource {
  final FirebaseAuthService _firebaseAuthService;

  AuthDataSource(this._firebaseAuthService);

  Future<Result<UserCredential>> firebaseLogin(AuthRequestModel request) async {
    try {
      return Success(await _firebaseAuthService.login(request));
    } on FirebaseAuthException catch (e) {
      return Failure(e.message);
    }
  }

  Future<Result<UserCredential>> firebaseRegister(
    AuthRequestModel model,
  ) async {
    try {
      return Success(await _firebaseAuthService.register(model));
    } on FirebaseAuthException catch (e) {
      return Failure(e.message);
    }
  }

  User? getCurrentUser() {
    return _firebaseAuthService.getCurrentUser();
  }
}
