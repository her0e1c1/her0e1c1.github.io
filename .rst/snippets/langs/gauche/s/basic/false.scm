(load-from-current-dirctory "include-gauche.scm")

(pw "nullはfalseとして扱われない!")
(p "see http://www.cs.indiana.edu/scheme-repository/R4RS/r4rs_8.html")

(define ls (list #f 0 "" '() (eof-object) (values)))
(dolist (i ls)
        (eval-null`(rs (if ,i #t))))

