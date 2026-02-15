import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/auth/data/model/auth_request_model.dart';

abstract class AuthRepository {
  Future<Result<UserCredential>> firebaseLogin(AuthRequestModel request);

  Future<Result<UserCredential>> firebaseRegister(AuthRequestModel model);

  User? getCurrentUser();
}
