(template-map
 (cut c <> :msg "You need to inlcude stdio.h to use NULL." :str #t)
 '("" "#include <stdio.h>")
#!DOC EOS
REPLACE
int main () {
  printf("%p", NULL);
}
EOS
)
