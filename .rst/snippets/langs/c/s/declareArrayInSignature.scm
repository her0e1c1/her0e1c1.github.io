(load-from-current-dirctory "include.scm")

(p (sphinx-section "declare array in signature"))

(define code #!HEREDOCUMENT EOS
#include <stdio.h>
int f(int a[]){
  return sizeof(a);
}
int main(){
  int a[] = {1,2,3,4,5};
  printf("%d != %d", sizeof(a), f(a));
}
EOS
)

(p (sphinx-warn "a[] of function parameter is a pointer which equals int* a"))
(run-c-from-string+ code)
