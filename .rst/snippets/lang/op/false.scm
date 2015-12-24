
(ps "false")

(run "perl -E 'say $a || \"\" || 0'")
(node "undefined || null || \"\" || 0 || false")

(c "if(!0)p(\"false\");")
(c "if(!NULL)p(\"false\");")
(c "char *s=\"\"; if(!*s)p(\"false\");")
(c "if(\"\")p(\"true\");")


(pw "nullはfalseとして扱われない!")
(p "see http://www.cs.indiana.edu/scheme-repository/R4RS/r4rs_8.html")
(define ls (list #f 0 "" '() (eof-object) (values)))
(dolist (i ls) (eval-null`(gosh (if ,i #t))))
