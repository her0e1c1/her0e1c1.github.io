(load-from-current-dirctory "include.scm")

(p (sphinx-section "strlen"))
(p "Return the length of string but NULL char is not contained.")
(ce "p(\"%lu\", strlen(\"abc\"));")
