import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/core/common_use_cases/get_current_user_use_case.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';
import 'package:flutter_winter_firebase/features/home/domain/entities/app_user_entity.dart';
import 'package:flutter_winter_firebase/features/home/domain/repository/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository _profileRepository;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  UpdateProfileUseCase(this._profileRepository, this._getCurrentUserUseCase);

  Future<Result<AppUserModel>> call(
    String displayName,
    String phone,
    String city,
  ) {
    User? user = _getCurrentUserUseCase();
    return _profileRepository.updateProfile(
      AppUserEntity(
        displayName,
        phone,
        city,
        user?.email ?? '',
        user?.uid ?? '',
      ).toModel(),
    );
  }
}
