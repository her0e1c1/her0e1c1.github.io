(load-from-current-dirctory "include.scm")

(p (sphinx-section "strcat"))
(p "Append strings")
(run "char s[]=\"abcde\", *t=\"hijk\" ; strcat(s, t); p(\"%s\", s);")
(run "char s[]=\"abcde\", t[]=\"hijk\"; strcat(s, t); p(\"%s\", s);")

(p "error! if pointer is used, it can't be modified. it is static allocated.")
(run "char *s=\"abcde\", *t=\"hijk\" ; strcat(s, t); p(\"%s\", s);")
(run "char *s=\"abcde\", t[]=\"hijk\"; strcat(s, t); p(\"%s\", s);")

;; // '\0'に対して追加もできる
(run "char s[]=\"\", t[]=\"abcde\"; strcat(s, t); p(\"%s\", s);")
