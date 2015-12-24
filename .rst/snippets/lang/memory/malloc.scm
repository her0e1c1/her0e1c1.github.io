
(p (sphinx-todo "2 * 文字数 + 1みたいな領域確保のときに+1し忘れのエラーとなるサンプル用意"))

(c "char*p=calloc(10, sizeof(char)); ps(p);"
   :msg "fill 0")

(p "reallocはO(n)じゃないの?; realloc uses copy")
(c "char*p=malloc(10);memcpy(p, \"abcd\", 5); printf(\"%s\", realloc(p, 5));")
(c "char*p=malloc(10);memcpy(p, \"abcd\", 5); if (realloc(p, 5) != p) ps(\"not same\");")

(p "mallocも0で初期化されているみたい")
(c "char*p=malloc(1 << 10); REP(i,10) if(p[i]) ps(\"1\");")

(c "char*p=malloc(1 << 31); printf(\"A%sA\",p);" :warn "Can't get enough memory")
