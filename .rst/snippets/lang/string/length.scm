
(run "perl -E 'say length shift' abc")
(gosh (string-length "abc"))
(emacs (length "abc"))
(c "p(\"%lu\", strlen(\"abc\"));"
   :msg "Return the length of string but NULL char is not contained.")

(p "if adding to the length of the string, you always refer '\0'")
(c "char *s=\"abc\", *t; t = s + strlen(s); if(!*t) p(\"NULL\");")


(ps "multi bytes")
(pw "文字長とバイト長を区別すること")

(gosh (string-length "あいうえお"))
(c "p(\"%lu\", strlen(\"あいうえお\"));")
