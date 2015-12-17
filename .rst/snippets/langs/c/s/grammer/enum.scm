(load-from-current-dirctory "include.scm")

(p (sphinx-section "enum"))
(run "enum E{A,B}; enum E e=A; p(\"%d\", e);")
(run "enum E{A,B}; enum E e=B; p(\"%d\", e);")
(run "enum E{A=10,B}; enum E e=A; p(\"%d\", e);")
(run "enum E{A=10,B}; enum E e=B; p(\"%d\", e);")

(p "alias enum")
(run "typedef enum E{A,B}F; F e=A; p(\"%d\", e);")
(run "typedef enum E{A,B}F; F e=B; p(\"%d\", e);")

(p "create a variable")
(run "enum E{A,B}e; e=A; p(\"%d\", e);")
(run "enum E{A,B}e; e=B; p(\"%d\", e);")
