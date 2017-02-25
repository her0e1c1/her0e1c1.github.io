
(ghc "concatMap (\a->[a, ',']) ['a'..'e']")

(emacs (mapcan (lambda (x) (list x (* x x))) '(1 2 3)))

(p "eval and emacs freezes (Don't eval this code!)
(mapcan (lambda (x) '(x)) '(1 2 3))
")
