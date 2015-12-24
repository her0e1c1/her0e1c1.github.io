
(c "enum E{A,B}; enum E e=A; p(\"%d\", e);")
(c "enum E{A,B}; enum E e=B; p(\"%d\", e);")
(c "enum E{A=10,B}; enum E e=A; p(\"%d\", e);")
(c "enum E{A=10,B}; enum E e=B; p(\"%d\", e);")

(p "alias enum")
(c "typedef enum E{A,B}F; F e=A; p(\"%d\", e);")
(c "typedef enum E{A,B}F; F e=B; p(\"%d\", e);")

(p "create a variable")
(c "enum E{A,B}e; e=A; p(\"%d\", e);")
(c "enum E{A,B}e; e=B; p(\"%d\", e);")
