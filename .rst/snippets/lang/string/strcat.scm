
(p (sphinx-section "strcat"))
(p "Append strings")
(c "char s[]=\"abcde\", *t=\"hijk\" ; strcat(s, t); p(\"%s\", s);")
(c "char s[]=\"abcde\", t[]=\"hijk\"; strcat(s, t); p(\"%s\", s);")

(p "error! if pointer is used, it can't be modified. it is static allocated.")
(c "char *s=\"abcde\", *t=\"hijk\" ; strcat(s, t); p(\"%s\", s);")
(c "char *s=\"abcde\", t[]=\"hijk\"; strcat(s, t); p(\"%s\", s);")

;; // '\0'に対して追加もできる
(c "char s[]=\"\", t[]=\"abcde\"; strcat(s, t); p(\"%s\", s);")
