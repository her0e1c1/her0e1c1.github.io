(load-from-current-dirctory "include.scm")

(p (sphinx-section "sprintf"))
(p "Number to string")
(run  "char b[32]; sprintf(b, \"%d\", 12345); p(\"%s\", b);")
