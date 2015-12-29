(emacs (-max '(1 2 3 4 5)))
(emacs (--max-by (> (-sum it) (-sum other)) '((1 2 3) (4 5 6) (7 8 9))))
