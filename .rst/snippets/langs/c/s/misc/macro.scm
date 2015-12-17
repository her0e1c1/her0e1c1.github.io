(load-from-current-dirctory "include.scm")

(p (sphinx-section "macro"))

(define code #!HEREDOCUMENT EOS
#include <stdio.h>

// List up pre defined macros
#define MACRO(x)                                 \
  printf("#x = %s\n" , #x);                      \
  printf("x  = %d\n" , x);                       \
  printf("__func__ = %s\n" ,__func__);           \
  printf("__LINE__ = %d\n" ,__LINE__);           \
  printf("__FILE__ = %s\n" ,__FILE__);           \
  printf("__DATE__ = %s\n" ,__DATE__);           \
  printf("__TIME__ = %s\n" ,__TIME__);           \

int main(){MACRO((1 + 2 + 3));}
EOS
)

(run-c-from-string+ code)
