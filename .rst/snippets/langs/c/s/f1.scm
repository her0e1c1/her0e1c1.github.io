(load-from-current-dirctory "include.scm")

(p (sphinx-section "declare and initialize"))

(define template
  (pa$ regexp-replace #/REPLACE/
#!HEREDOCUMENT EOS
void a(int range){
  REPLACE
}
int main() {a(10);}
EOS
))

(define error.c (template "int c[range] = {0};"))
(p (sphinx-warn "You can't declare like this."))
(run-c-from-string+ error.c)

(define ok.c (template "
  int c[range];
  for (int i = 0; i < range; i++) c[i] = 0;
"))
(p "You need to initialize each item.")
(run-c-from-string+ ok.c)
