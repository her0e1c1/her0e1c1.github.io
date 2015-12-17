(load-from-current-dirctory "include.scm")

(p (sphinx-section "strcpy"))

;# s1にs2の'\0'までコピーする。s1はメモリ確保しておく必要あり。
(ce "char s[4];strcpy(s, \"abc\"); p(\"%s\", s);")

;# 適切な配列を確保しなかったので、メモリリーク
;a(){ ce "char s[50];strcpy(s, \"$1\"); printf(\"%s\", s);";}; a `perl -e 'print "x" x 200'`
