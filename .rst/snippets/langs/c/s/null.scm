(load-from-current-dirctory "include.scm")

(p (sphinx-section "NULL"))

(p (sphinx-warn "You need to inlcude stdio.h to use NULL."))

(define NULL.c #!HEREDOCUMENT EOS
int main () {
  printf("%p", NULL);
}
EOS
)

(define NULL2.c #"#include <stdio.h>
~NULL.c")

(run-c-from-string+ NULL.c)
(run-c-from-string+ NULL2.c)
