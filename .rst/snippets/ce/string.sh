HERE=$(dirname $0)
cat <<EOS

========
 String
========

$(go <<EOG
 (define (run cmd)
   (p (sphinx-block (format "$ ce '~a'\n~a" cmd (run-ce cmd)) :code-block "sh")))
 (define ce run)

 (p (sphinx-section "strcat"))
 (p "Append strings")
 (run "char s[]=\"abcde\", *t=\"hijk\" ; strcat(s, t); p(\"%s\", s);")
 (run "char s[]=\"abcde\", t[]=\"hijk\"; strcat(s, t); p(\"%s\", s);")

 (p "error! if pointer is used, it can't be modified. it is static allocated.")
 (run "char *s=\"abcde\", *t=\"hijk\" ; strcat(s, t); p(\"%s\", s);")
 (run "char *s=\"abcde\", t[]=\"hijk\"; strcat(s, t); p(\"%s\", s);")

;; // '\0'に対して追加もできる
 (run "char s[]=\"\", t[]=\"abcde\"; strcat(s, t); p(\"%s\", s);")
;; // ce 'char p[]="abcde", q[]="AAA"; memcpy(p,q,3+1); printf("%s", p);'
;; // ce 'char *p="abcdebce", *q="bc"; printf("%p", strstr(p, q));' 

 (p (sphinx-section "strstr"))
 (p "if searching an empty string, it is always true.")
 (run "p(\"(%s)\", strstr(\"\", \"\"));")
 (run "p(\"%s\", strstr(\"abcde\", \"\"));")
 (run "p(\"%s\", strstr(\"abcde\", \"ABC\"));")
 ; # s1にs2の文字列が一致した場合、その先頭ポインタを返す
 (ce "ps(strstr(\"123456789\", \"345\"));")
 (ce "ps(strstr(\"123456789\", \"355\"));")

 (p (sphinx-section "strlen"))
 (p "Return the length of string but NULL char is not contained.")
 (ce "p(\"%lu\", strlen(\"abc\"));")

 (p (sphinx-section "strmode"))
 ;# stat.st_modeを文字列で表示. \0を含めて11文字 (12?)
 ;# S_IRWXUは、RWX全てのUSR権限なので、読み込み・書き込み・実行の3つの和
 (ce "char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s);")
 (ce "char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s[11]==0? \"NULL\":\"NO\");")

 (p (sphinx-section "strdup"))
 ;# 文字列をコピーする。freeするのを忘れない。
 (ce "char* s; if((s=strdup(\"test\")) != NULL){ps(s); free(s);}')")

 (p (sphinx-section "strerror"))
 (ce "ps(strerror(1));")

 (p (sphinx-section "sprintf"))
 (p "Number to string")
 (run  "char b[32]; sprintf(b, \"%d\", 12345); p(\"%s\", b);")

 (p "In case of static declaration of string, it can't be modified.")
 (run "char *c =\"Memory allocated static  string\"; c[1] = 'E'; p(\"NOT REACHED => %s\", c);")
 (run "char c[]=\"Memory allocated dynamic string\"; c[1] = 'E'; p(\"REACHED => %s\", c);")

 (p "Declare")
 (run "char a[] = \"abc\";")
 (run "char *a  = \"abc\";")
 (run "char a[] = {'a', 'b', 'c'};")
 (p "Error")
 (run "char *a  = {'a', 'b', 'c'};")

 (p "false")
 (run "if(!0)p(\"false\");")
 (run "if(!NULL)p(\"false\");")
 (run "char *s=\"\"; if(!*s)p(\"false\");")
 (run "if(\"\")p(\"true\");")

 (p (sphinx-section "sizeof"))
 (p "with %zu print as unsigned decimal")
 (let1 types '(char short int size_t void* long float double "long float" "long long" "long double" "double double")
  (dolist (t (map x->string types))
   (run #"p(\"%zu\", sizeof(~t));")))

 (p "sizeof gets all the memory size, not the length of an array")
 (run "int b[10]; p(\"%zu\", sizeof(b));")

 ;; int l = sizeof(buff1) / sizeof(buff1[0]);
 ;; printf("length buff1 = %d\n", l);

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

 (p (sphinx-section "strcmp"))
 (ce "if(strcmp(\"abc\", \"abc\") == 0) p(\"true\");")
 (ce "p(\"%d\", strcmp(\"a\", \"z\"));")
 (ce "p(\"%d\", strcmp(\"z\", \"a\"));")

 (p (sphinx-section "strcpy"))
 ;# s1にs2の'\0'までコピーする。s1はメモリ確保しておく必要あり。
 (ce "char s[4];strcpy(s, \"abc\"); p(\"%s\", s);")
 ;# 適切な配列を確保しなかったので、メモリリーク
 ;a(){ ce "char s[50];strcpy(s, \"$1\"); printf(\"%s\", s);";}; a `perl -e 'print "x" x 200'`

EOG
)

EOS
