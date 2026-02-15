import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:flutter_winter_firebase/features/auth/data/model/auth_request_model.dart';
import 'package:flutter_winter_firebase/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<Result<UserCredential>> firebaseLogin(AuthRequestModel request) {
    return _authDataSource.firebaseLogin(request);
  }

  @override
  Future<Result<UserCredential>> firebaseRegister(AuthRequestModel model) {
    return _authDataSource.firebaseRegister(model);
  }

  @override
  User? getCurrentUser() {
    return _authDataSource.getCurrentUser();
  }
}
