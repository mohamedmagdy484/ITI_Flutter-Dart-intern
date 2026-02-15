import 'dart:io';
/*
Task 1
Mohamed Magdy
 */
void main() {
  int n=4;
  String brucef="";
  for (int i = 1; i<=n; i++) {
    if (i.isOdd) {
        brucef+="i hate ";
      }

    if (i.isEven) {
      brucef+="i love ";

    }
    if(i==n){
      brucef+="it ";
    }
    else{
      brucef+="that ";
    }
    }

print(brucef);
}


