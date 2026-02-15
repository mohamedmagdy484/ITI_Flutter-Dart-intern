import 'dart:io';
import'task_1.dart';
class Client {
  String? name;
  Personaldata? personaldata;
  Client({required this.name,this.personaldata });
}
class Personaldata{
  String? email;
  Address? address;
  Personaldata({this.email,this.address});
}
class Address {
  String? country;
  String? city;
  String? street;
  Address({this.country,this.city,this.street});
}



extension ClientExtension on Client {
  String getFullInfo() {
    return '''
• name: $name
• email: ${personaldata?.email ?? "Unspecified"}
• country: ${personaldata?.address?.country ?? "Unspecified"}
• city: ${personaldata?.address?.city ?? "Unspecified"}
• street: ${personaldata?.address?.street ?? "Unspecified"}
''';
  }
}
