
(sh "f(){}" :msg "declare minimum")

(sh "f(){ echo 1 }; f" :warn "missing ;")
(sh "f(){ echo 1;}; f")

(sh "f(){echo 1;} ;f" :warn "need a space after {")
(sh "f(){ echo 1;};f")

(c #!DOC EOS
#include <stdio.h>
int f(int a[]){
  return sizeof(a);
}
int main(){
  int a[] = {1,2,3,4,5};
  printf("%d != %d", sizeof(a), f(a));
}
EOS
:warn "a[] of function parameter is a pointer which equals int* a"
)
