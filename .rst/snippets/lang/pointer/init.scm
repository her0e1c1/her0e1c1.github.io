
(p "
``int *p, *q;`` と複数宣言する場合があるので
``int* a;`` よりも
``int *a;`` と宣言したほうが良い
")
(template-map
 (cut <> :str #t)
 '("int *p, *q;"
   "int *p, q;")
#!DOC EOS
#include <stdio.h>
int main (){
  int a = 1;
  REPLACE
  q = &a;
  printf("%d", *q);
}
EOS
)
