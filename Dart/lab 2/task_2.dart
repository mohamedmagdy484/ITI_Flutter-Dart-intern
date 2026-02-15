import 'dart:io';

extension UsernameValidator on String {
  bool validateUsername() {
    if (length < 6 || length > 12) {
      return false;
    }

    final regExp = RegExp(r'^[a-zA-Z0-9_$]+$');

    return regExp.hasMatch(this);
  }
}

void main() {
String user1="mohamed23\$";
String user2="mohamed@";
String user3="fghfglkhjfghljfghlfgjhflgkhj";
print(user1.validateUsername());
print(user2.validateUsername());
print(user3.validateUsername());


}