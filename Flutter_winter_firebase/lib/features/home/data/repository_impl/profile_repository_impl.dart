import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/home/data/data_source/profile_data_source.dart';
import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';
import 'package:flutter_winter_firebase/features/home/domain/entities/app_user_entity.dart';
import 'package:flutter_winter_firebase/features/home/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl(this._profileDataSource);

  @override
  Future<Result<bool>> signOut() async {
    try {
      return Success(await _profileDataSource.signOut());
    } on FirebaseAuthException catch (e) {
      return Failure(e.message);
    }
  }

  @override
  Future<Result<AppUserModel>> updateProfile(AppUserModel appUserModel) async {
    try {
      return Success(await _profileDataSource.updateProfile(appUserModel));
    } on FirebaseException catch (e) {
      return Failure(e.message);
    }
  }

  @override
  Future<Result<void>> createProfile(AppUserModel appUserModel) async {
    try {
      return Success(await _profileDataSource.createProfile(appUserModel));
    } on FirebaseException catch (e) {
      return Failure(e.message);
    }
  }

  @override
  Future<Result<AppUserModel>> getProfile(String uid) async {
    try {
      return Success(await _profileDataSource.getProfile(uid));
    } on FirebaseException catch (e) {
      return Failure(e.message);
    }
  }
}
