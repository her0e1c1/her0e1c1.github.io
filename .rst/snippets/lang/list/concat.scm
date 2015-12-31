
(p "末尾に要素を加える")
(gosh (begin (define a '(1 2)) (append! a '(3))))
(gosh (begin (define a '()) (append! a '(1))) :warn "NULLの場合は書き変わらないので注意")

(emacs (-concat '(1 2 3) '(4) '(5 6 7)))
(emacs (-concat '(1 2 3) 4 '(5)) :warn "need a list")
