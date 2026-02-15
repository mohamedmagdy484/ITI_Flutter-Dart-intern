import 'dart:io';
import 'extension_full_info.dart';




  void main() {
    Client test = Client(name: "mohamed",
    personaldata:Personaldata(email: "iti@gmail.com",address:Address(country: "egypt",city: "cairo",street:"-"))
    );
    Client testt=Client(name: "mohamed",personaldata: Personaldata(email: "iti_dart@gmail.com",address:Address()));


    print(test.getFullInfo());
    print(testt.getFullInfo());

  }







