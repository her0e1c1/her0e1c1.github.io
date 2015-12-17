(load-from-current-dirctory "include.scm")

(p (sphinx-section "Declare"))
(run "int a[10];")
(run "static int a[10];")

(run "int a[] = {1,2,3};")
(run "int a[] = {1,2,3}; int *b=a;")

(p (sphinx-warn "However you can't assign a vector to a pointer directly."))
(run "int *a  = {1,2,3};")

(p "Initialize a 2D array")
(run "int a[10][10] = {10}; p(\"%d\", a[0][0]);")

(p "Initialize a 2D array")
(run "int a[10][10] = {{ 0 }}; p(\"%d\", a[0][0]);")

(p "valc. so you can allocate memroy dynamically even if it is an array")
(run "int k=10; int a[k];")

(p "But with static, an error occurs")
(run "int k=10;static int a[k];")
