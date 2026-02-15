import 'dart:io';


void main(){
  print("enter integer");
  String n=stdin.readLineSync()!;
int ans =int.parse(n);
reverse(ans);
print(reverse(ans));



  }

int reverse(int x){
int get=x.abs();
int l=0;
while(get>0){
  int digit=get%10;
  l=l*10+digit;
  get=get~/10;
}
if(x<0){
  return -l;
}
else{
  return l;
}

}


