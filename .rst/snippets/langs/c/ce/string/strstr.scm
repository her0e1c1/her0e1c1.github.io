(load-from-current-dirctory "include.scm")

(p (sphinx-section "strstr"))

(p "if searching an empty string, it is always true.")
(run "p(\"(%s)\", strstr(\"\", \"\"));")
(run "p(\"%s\", strstr(\"abcde\", \"\"));")
(run "p(\"%s\", strstr(\"abcde\", \"ABC\"));")

; # s1にs2の文字列が一致した場合、その先頭ポインタを返す
(ce "ps(strstr(\"123456789\", \"345\"));")
(ce "ps(strstr(\"123456789\", \"355\"));")

;; // ce 'char *p="abcdebce", *q="bc"; printf("%p", strstr(p, q));' 
