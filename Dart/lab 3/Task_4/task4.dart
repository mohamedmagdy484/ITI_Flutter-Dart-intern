import 'dart:io';
//task 4
void main() {
  String username = "ali";
  distinctchar(username);


}

void distinctchar(String username) {

  Set<String> distinctChars = username.split('').toSet();

  int count = distinctChars.length;

  if (count.isEven) {
    print("CHAT WITH HER!");
  } else {
    print("IGNORE HIM!");
  }
}