import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);
  User? call() {
    return _authRepository.getCurrentUser();
  }
}
