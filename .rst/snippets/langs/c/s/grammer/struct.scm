(load-from-current-dirctory "include.scm")

(p (sphinx-section "struct"))
(run "typedef struct {char name[64];}S; S s; strcpy(s.name, \"Bob\"); p(\"%s\", s.name);")

(run "typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=0; p(\"%d\", b.bool);")
(run "typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=1; p(\"%d\", b.bool);")
(run "typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=2; p(\"%d\", b.bool);")
