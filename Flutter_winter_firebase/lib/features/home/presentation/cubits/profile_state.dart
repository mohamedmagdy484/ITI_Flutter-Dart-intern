import 'package:flutter_winter_firebase/features/home/domain/entities/app_user_entity.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileUpdatedState extends ProfileState {
  final AppUserEntity appUserEntity;

  ProfileUpdatedState(this.appUserEntity);
}

class ProfileLoadedState extends ProfileState {
  final AppUserEntity appUserEntity;

  ProfileLoadedState(this.appUserEntity);
}

class ProfileErrorState extends ProfileState {}

class UserLogoutState extends ProfileState {}
