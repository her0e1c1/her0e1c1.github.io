(ps "remove both of sides whitespaces")

(gosh (string-trim-both " abc "))
(emacs (s-trim "  a  "))
(emacs (s-trim " a\n"))
(emacs (s-trim " a\n\t"))
