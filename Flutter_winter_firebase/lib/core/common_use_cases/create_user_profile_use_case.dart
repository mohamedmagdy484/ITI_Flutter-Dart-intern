import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_winter_firebase/core/common_use_cases/get_current_user_use_case.dart';
import 'package:flutter_winter_firebase/features/home/domain/entities/app_user_entity.dart';
import 'package:flutter_winter_firebase/features/home/domain/repository/profile_repository.dart';

class CreateUserProfileUseCase {
  final ProfileRepository _profileRepository;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  CreateUserProfileUseCase(
    this._profileRepository,
    this._getCurrentUserUseCase,
  );

  Future<void> call() async {
    User? user = _getCurrentUserUseCase();
    _profileRepository.createProfile(
      AppUserEntity('', '', '', user?.email ?? '', user?.uid ?? '').toModel(),
    );
  }
}
