import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/common_use_cases/create_user_profile_use_case.dart';
import 'package:flutter_winter_firebase/core/network/result.dart';
import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';
import 'package:flutter_winter_firebase/features/home/domain/use_cases/get_profile_use_case.dart';
import 'package:flutter_winter_firebase/features/home/domain/use_cases/sign_out_use_case.dart';
import 'package:flutter_winter_firebase/features/home/domain/use_cases/update_profile_use_case.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._signOutUSeCase,
    this._updateProfileUseCase,
    this._createProfileUseCase,
    this._getProfileUseCase,
  ) : super(ProfileInitialState());
  final SignOutUSeCase _signOutUSeCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final CreateUserProfileUseCase _createProfileUseCase;
  final GetProfileUseCase _getProfileUseCase;

  Future<void> signOut() async {
    emit(ProfileLoadingState());
    Result<bool> result = await _signOutUSeCase();
    if (result is Success) {
      emit(UserLogoutState());
    } else {
      emit(ProfileErrorState());
    }
  }

  void updateProfile(String displayName, String phone, String city) async {
    emit(ProfileLoadingState());
    Result<AppUserModel> result = await _updateProfileUseCase(
      displayName,
      phone,
      city,
    );
    if (result is Success<AppUserModel>) {
      emit(ProfileUpdatedState((result.data!.toEntity())));
      emit(ProfileLoadedState(result.data!.toEntity()));
    } else {
      emit(ProfileErrorState());
    }
  }

  Future<void> getProfile() async {
    Result<AppUserModel> result = await _getProfileUseCase();
    if (result is Success<AppUserModel>) {
      debugPrint('Profile Loaded ${result.data!.toMap().toString()}');
      debugPrint('Profile Loaded ${result.data!.toEntity().toString()}');
      emit(ProfileLoadedState(result.data!.toEntity()));
    } else {
      emit(ProfileErrorState());
    }
  }

  // void createProfile() async {
  //   await _createProfileUseCase();
  // }
}
