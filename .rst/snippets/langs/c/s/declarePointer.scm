(load-from-current-dirctory "include.scm")
(p (sphinx-section "declare pointers"))

(define template
  (pa$ regexp-replace #/REPLACE/
#!HEREDOCUMENT EOS
int main (){
  int a = 1;
  REPLACE
  q = &a;
}
EOS
))
(define pointer.c (template "int *p, *q;"))
(define pointer2.c (template "int *p, *q;"))

(p "
``int *p, *q;`` と複数宣言する場合があるので
``int *a;`` と宣言したほうが良い
")

(p (sphinx-warn "pointerを２つ同時に宣言するときはアスターは２ついる"))
(run-c-from-string+ pointer.c)
(p (sphinx-warn "type of q is int"))
(run-c-from-string+ pointer2.c)
