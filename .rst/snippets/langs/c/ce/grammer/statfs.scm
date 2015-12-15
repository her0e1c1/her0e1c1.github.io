(load-from-current-dirctory "include.scm")

(p (sphinx-section "statfs"))
;; mount info
(run "struct statfs s; statfs(\"/home\", &s); p(\"%s\", s.f_mntonname);")
