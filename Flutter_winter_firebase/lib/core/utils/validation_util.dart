import 'package:flutter/src/widgets/framework.dart';

class ValidationUtil {
  ValidationUtil._();

  static String? validateUsername(String value) {
    return value.isEmpty ? 'Username is required' : null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) return 'Confirm password is required';
    if (value != password) return 'Passwords do not match';
    return null;
  }
}
