
(perl "say for map {$_ + 1} 1..3")

(c #!DOC EOS
#include <stdio.h>
// 引数に関数の型を指定(Int -> Int)
int* map(int (* f)(int), int* list){
  int* p = list;
  while(*list){
    *list = f(*list);
    list++;
  }
  return p;
}
int doubleInt(int x){
  return x * x;
}
int main(){
  int v[] = {1, 2, 3, 0};
  int* rv = map(doubleInt, v);
  for(int* p = rv; *p; p++){
    printf("%d, ", *p);
  }
}
EOS
:str #t)
