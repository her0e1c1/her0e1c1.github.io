(load-from-current-dirctory "include.scm")

(p (sphinx-section "false"))

(run "if(!0)p(\"false\");")
(run "if(!NULL)p(\"false\");")
(run "char *s=\"\"; if(!*s)p(\"false\");")
(run "if(\"\")p(\"true\");")
