
(run "perl -E 'say length shift' 1234567890")
(gosh (string-length "test"))

(pw "文字長とバイト長を区別すること")
(gosh (string-length "あいうえお"))

(ps "strlen")
(p "Return the length of string but NULL char is not contained.")
(c "p(\"%lu\", strlen(\"abc\"));")

(p "if adding to the length of the string, you always refer '\0'")
(c "char *s=\"abc\", *t; t = s + strlen(s); if(!*t) p(\"NULL\");")

(emacs (length "HOGE"))
