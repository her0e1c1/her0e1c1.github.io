
(c "typedef struct {char name[64];}S; S s; strcpy(s.name, \"Bob\"); p(\"%s\", s.name);")
(c "typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=0; p(\"%d\", b.bool);")
(c "typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=1; p(\"%d\", b.bool);")
(c "typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=2; p(\"%d\", b.bool);")
