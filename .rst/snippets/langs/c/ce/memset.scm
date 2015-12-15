(load-from-current-dirctory "include.scm")

(p (sphinx-section "memset"))

(p "Fill 0")
(run "int a[10][10]; memset(a, 0, sizeof(a)); p(\"%d\", a[0][0]);")

(p "Fill -1")
(run "int a[10][10]; memset(a, -1, sizeof(a)); p(\"%d\", a[0][0]);")

(p "Don't work because memset fills numbers but 0 or -1 at each byte")
(run "int a[10][10]; memset(a, 1, sizeof(a)); p(\"%d\", a[0][0]);")
(run "int a[10][10]; memset(a, 10, sizeof(a)); p(\"%d\", a[0][0]);")
