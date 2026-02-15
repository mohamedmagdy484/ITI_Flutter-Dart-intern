import 'dart:io';


void main() {
String word="Dart Programming Language";
print(longest_word(word));




}
String longest_word(String x){
  List m=x.split(" ");
    String result=m[0];
  for(int i=0;i<m.length;i++){
    if(m[i].length >result.length){
      result=m[i];
    }
  }
  return result;
}