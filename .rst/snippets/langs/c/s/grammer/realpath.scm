(load-from-current-dirctory "include.scm")

(p (sphinx-section "realpath"))

(p "Normalize path. I think return value is the same as a buff-stored value.")
(run "char s[PATH_MAX]; p(\"%s\", realpath(\"/home/../home/././.\", s));")
