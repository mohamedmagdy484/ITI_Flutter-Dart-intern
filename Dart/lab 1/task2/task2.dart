import 'dart:io';
/*
Task 2
Mohamed Magdy
 */
void main(){
int k,n,w;
//k for banana price
//n user money
//w number of banana
  n=10;// soldier dollars
  w=4;// number of banans
  k=3;// first banana price
  int total=0;// total for banana price increment
  for(int i=1;i<=w;i++){
    total+=i*k;
  }
  int borrow;
  borrow=((total)-n);
  if (borrow<0){
    borrow =0;
  }
  print("soldier has to borrow : $borrow");



}