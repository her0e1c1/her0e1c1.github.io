(load-from-current-dirctory "include.scm")

(p (sphinx-section "sizeof"))
(p "with %zu print as unsigned decimal")
(let1 types '(char short int size_t void* long float double "long float" "long long" "long double" "double double")
(dolist (t (map x->string types))
(run #"p(\"%zu\", sizeof(~t));")))

(p "sizeof gets all the memory size, not the length of an array")
(run "int b[10]; p(\"%zu\", sizeof(b));")

;; int l = sizeof(buff1) / sizeof(buff1[0]);
;; printf("length buff1 = %d\n", l);
