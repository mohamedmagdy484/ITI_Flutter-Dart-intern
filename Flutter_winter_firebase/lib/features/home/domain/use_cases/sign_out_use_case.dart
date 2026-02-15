import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/home/domain/repository/profile_repository.dart';

class SignOutUSeCase {
  final ProfileRepository _profileRepository;

  SignOutUSeCase(this._profileRepository);
  Future<Result<bool>> call() {
    return _profileRepository.signOut();
  }
}
