
(run "echo $HISTSIZE")
(run "echo $PWD")
(run "echo $HOME")
(run "echo $OLDPATH")
(run "echo $SECONDS")

(zsh "echo $(echo ~)(:a)" :msg "/home/USER")
(zsh "echo $(echo ~/.emacs.d)(:A)" :msg "expand symbol link")

(c #!DOC EOS
#include <stdio.h>
// List up pre defined macros
#define MACRO(x)                                 \
  printf("#x = %s\n" , #x);                      \
  printf("x  = %d\n" , x);                       \
  printf("__func__ = %s\n" ,__func__);           \
  printf("__DATE__ = %s\n" ,__DATE__);           \
  printf("__TIME__ = %s\n" ,__TIME__);           \

int main(){MACRO((1 + 2 + 3));}
EOS
:str #t)
