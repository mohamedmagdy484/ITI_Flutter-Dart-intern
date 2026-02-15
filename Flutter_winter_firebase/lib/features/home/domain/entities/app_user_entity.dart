import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';

class AppUserEntity {
  final String displayName;
  final String phone;
  final String city;
  final String email;
  final String uid;

  AppUserEntity(this.displayName, this.phone, this.city, this.email, this.uid);

  @override
  String toString() {
    return 'AppUserEntity(displayName: $displayName, phone: $phone, city: $city, email: $email, uid: $uid)';
  }
}

extension AppUserEntityExtension on AppUserEntity {
  AppUserModel toModel() {
    return AppUserModel(displayName, phone, city, email, uid);
  }
}
