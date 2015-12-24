
(ghc "concatMap (\a->[a, ',']) ['a'..'e']")


(p "末尾に要素を加える")
(gosh (begin (define a '(1 2)) (append! a '(3))))
(gosh (begin (define a '()) (append! a '(1))) :warn "NULLの場合は書き変わらないので注意")
