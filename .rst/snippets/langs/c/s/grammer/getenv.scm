(load-from-current-dirctory "include.scm")

(p (sphinx-section "env"))
(run "p(\"%s\", getenv(\"USER\"));")
(p "NULL if the name doesn't exist.")
(run "p(\"%s\", getenv(\"user\"));")
