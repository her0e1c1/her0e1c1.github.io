
(p "Return the minimum value")
(node "Math.min(1, 2, 3)")

(emacs (-min '(1 2 3 4 5)))
(emacs (--min-by (> (-sum it) (-sum other)) '((1 2 3) (4 5 6) (7 8 9))))