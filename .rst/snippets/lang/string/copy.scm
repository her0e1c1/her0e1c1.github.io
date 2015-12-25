
(ps "strdup")
;# 文字列をコピーする。freeするのを忘れない。
(c "char* s; if((s=strdup(\"test\")) != NULL){ps(s); free(s);}')")

(ps "strcpy")
(c "char s[4];strcpy(s, \"abc\"); p(\"%s\", s);"
   :warn "s1にs2の'\0'までコピーする。s1はメモリ確保しておく必要あり")

(run #!DOC EOS
a(){ ce "char s[50];strcpy(s, \"$1\"); printf(\"%s\", s);";}; a `perl -e 'print q/x/ x 10'`
EOS
)

(run #!DOC EOS
a(){ ce "char s[50];strcpy(s, \"$1\"); printf(\"%s\", s);";}; a `perl -e 'print q/x/ x 200'`
EOS
:warn "適切な配列を確保しなかったので、メモリリーク")
