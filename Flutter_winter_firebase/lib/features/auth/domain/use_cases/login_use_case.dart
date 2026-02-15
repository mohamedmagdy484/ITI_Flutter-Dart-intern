import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/auth/domain/entities/auth_request_entity.dart';
import 'package:flutter_winter_firebase/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Result<UserCredential>> call(AuthRequestEntity entity) {
    return _authRepository.firebaseLogin(entity.toModel());
  }
}
