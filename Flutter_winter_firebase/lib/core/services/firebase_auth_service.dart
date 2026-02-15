import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/features/auth/data/model/auth_request_model.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  static final FirebaseAuthService authService = FirebaseAuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> login(AuthRequestModel request) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> register(AuthRequestModel request) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
