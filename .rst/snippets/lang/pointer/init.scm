
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

;; さらにポインターのアドレスを取得する場合は ::

;;  int a = 1;
;;  int *p = &a;
;;  int **p = &p;


;; ::

;;  int   *p1;
;;  char  *p2;
;;  float *p3;

;;  //以下は、どれも4byte先のアドレスになります。
;;  p1++
;;  p2++
;;  p3++
