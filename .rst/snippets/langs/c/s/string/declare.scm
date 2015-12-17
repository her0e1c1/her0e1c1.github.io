(load-from-current-dirctory "include.scm")

(p (sphinx-section "Declare"))

(run "char a[] = \"abc\";")
(run "char *a  = \"abc\";")
(run "char a[] = {'a', 'b', 'c'};")

(p (sphinx-warn "Error"))
(run "char *a  = {'a', 'b', 'c'};")

(p (sphinx-warn "In case of static declaration of string, it can't be modified."))
(run "char *c =\"Memory allocated static  string\"; c[1] = 'E'; p(\"NOT REACHED => %s\", c);")
(run "char c[]=\"Memory allocated dynamic string\"; c[1] = 'E'; p(\"REACHED => %s\", c);")
