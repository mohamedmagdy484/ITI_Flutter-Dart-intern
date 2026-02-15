import 'package:flutter_winter_firebase/features/home/domain/entities/app_user_entity.dart';

class AppUserModel {
  final String displayName;
  final String phone;
  final String city;
  final String email;
  final String uid;

  AppUserModel(this.displayName, this.phone, this.city, this.email, this.uid);

  Map<String, dynamic> toMap() => {
    'displayName': displayName,
    'phone': phone,
    'city': city,
    'email': email,
    'uid': uid,
  };

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      map['displayName'],
      map['phone'],
      map['city'],
      map['email'],
      map['uid'],
    );
  }

  @override
  String toString() {
    return 'AppUserModel{displayName: $displayName, phone: $phone, city: $city, email: $email, uid: $uid}';
  }
}

extension AppUserModelExtension on AppUserModel {
  AppUserEntity toEntity() =>
      AppUserEntity(displayName, phone, city, email, uid);
}
