import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/core/common_use_cases/get_current_user_use_case.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';
import 'package:flutter_winter_firebase/features/home/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository _profileRepository;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  GetProfileUseCase(this._profileRepository, this._getCurrentUserUseCase);

  Future<Result<AppUserModel>> call() async {
    User? user = _getCurrentUserUseCase();
    return await _profileRepository.getProfile(user?.uid ?? '');
  }
}
