(load-from-current-dirctory "include.scm")

(p (sphinx-section "environ"))

(p "Get values of evriron")
(run "char**e=environ;while(*e){if(!strcmp(*e, \"USER=me\"))p(\"%s\", *e); e++;}")
