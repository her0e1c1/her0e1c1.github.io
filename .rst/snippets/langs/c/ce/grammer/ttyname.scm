(load-from-current-dirctory "include.scm")

(p (sphinx-section "ttyname"))

 (p "stdin 0, stdout 1, stderr 2")
 (p "in this case, because I run this command as subprocess, these results are NULL.")
 (run "p(\"%s\", ttyname(0));")
 (run "p(\"%s\", ttyname(1));")
 (run "p(\"%s\", ttyname(2));")
