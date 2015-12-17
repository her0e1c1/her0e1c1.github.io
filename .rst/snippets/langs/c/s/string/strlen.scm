(load-from-current-dirctory "include.scm")

(p (sphinx-section "strlen"))
(p "Return the length of string but NULL char is not contained.")
(ce "p(\"%lu\", strlen(\"abc\"));")

(p "if adding to the length of the string, you always refer '\0'")
(run "char *s=\"abc\", *t; t = s + strlen(s); if(!*t) p(\"NULL\");")
