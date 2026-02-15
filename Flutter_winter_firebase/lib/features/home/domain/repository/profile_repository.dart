import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';

abstract class ProfileRepository {
  Future<Result<bool>> signOut();
  Future<Result<AppUserModel>> updateProfile(AppUserModel appUserModel);
  void createProfile(AppUserModel appUserModel);
  Future<Result<AppUserModel>> getProfile(String uid);
}
