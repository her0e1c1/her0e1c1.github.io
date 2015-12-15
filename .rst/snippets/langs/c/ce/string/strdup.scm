(load-from-current-dirctory "include.scm")

(p (sphinx-section "strdup"))

;# 文字列をコピーする。freeするのを忘れない。
(ce "char* s; if((s=strdup(\"test\")) != NULL){ps(s); free(s);}')")
