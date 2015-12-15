(load-from-current-dirctory "include.scm")

(p (sphinx-section "exit"))
(run "p(\"%d\", EXIT_SUCCESS);")
(run "p(\"%d\", EXIT_FAILURE);")
(run "exit(EXIT_SUCCESS); p(\"NOT REACHED\");")
