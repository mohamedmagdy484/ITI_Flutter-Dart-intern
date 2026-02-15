import 'package:flutter_winter_firebase/features/auth/data/model/auth_request_model.dart';

class AuthRequestEntity {
  final String email;
  final String password;

  AuthRequestEntity({required this.email, required this.password});
}

extension AuthRequestEntityExtension on AuthRequestEntity {
  AuthRequestModel toModel() {
    return AuthRequestModel(email: email, password: password);
  }
}
