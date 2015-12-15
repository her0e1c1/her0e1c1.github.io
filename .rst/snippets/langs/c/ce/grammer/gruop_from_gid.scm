(load-from-current-dirctory "include.scm")

(p (sphinx-section "group_from_gid"))

(p "if gid (the first arg) exists, return its name")
(run "p(\"%s\", group_from_gid(0, 0));")

(p "if gid doesn't exists, return the number. the return type is not int but char*")
(run "p(\"%s\", group_from_gid(123456, 0));")

(p "Or just return NULL if the second argument is nonzero")
(run "p(\"%s\", group_from_gid(123456, 1));")
