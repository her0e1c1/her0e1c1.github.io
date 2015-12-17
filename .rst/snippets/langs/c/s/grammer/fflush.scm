(load-from-current-dirctory "include.scm")

(p (sphinx-section "fflush"))

(p "printf doesn't output until it encounters newline. an error will occur because of referring null pointer")
(run "char*a=NULL, b; p(\"this is NOT printed.\"); b=*a;")
(run "char*a=NULL, b; p(\"this is printed.\"); fflush(stdout); b=*a;")
