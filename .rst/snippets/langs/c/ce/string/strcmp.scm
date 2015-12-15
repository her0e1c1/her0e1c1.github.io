(load-from-current-dirctory "include.scm")

(p (sphinx-section "strcmp"))
(ce "if(strcmp(\"abc\", \"abc\") == 0) p(\"true\");")
(ce "p(\"%d\", strcmp(\"a\", \"z\"));")
(ce "p(\"%d\", strcmp(\"z\", \"a\"));")
