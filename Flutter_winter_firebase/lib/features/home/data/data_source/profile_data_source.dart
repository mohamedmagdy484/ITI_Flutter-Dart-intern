import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/core/services/firebase_auth_service.dart';
import 'package:flutter_winter_firebase/core/services/firebase_db_service.dart';
import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDataSource {
  final FirebaseAuthService _firebaseAuthService;
  final FirebaseDbService _firebaseDbService;
  final SupabaseClient _supabaseClient;

  ProfileDataSource(
    this._firebaseAuthService,
    this._firebaseDbService,
    this._supabaseClient,
  );

  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
  }

  Future<AppUserModel> updateProfile(AppUserModel appUserModel) async {
    try {
      await _firebaseDbService.updateProfile(appUserModel);
      return await _firebaseDbService.getProfile(appUserModel.uid);
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<AppUserModel> getProfile(String uid) async {
    try {
      AppUserModel appUserModel = await _firebaseDbService.getProfile(uid);
      debugPrint(appUserModel.toEntity().toString());
      debugPrint(appUserModel.toString());
      return appUserModel;
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<void> createProfile(AppUserModel appUserModel) async {
    try {
      await _firebaseDbService.createProfile(appUserModel);
    } on FirebaseException catch (e) {
      rethrow;
    }
  }
}
