
(p "参照先が同じはeq?を使う")

(gosh (eq? 0.1 0.1))
(gosh (eq? "a" "a"))
(gosh (eq? 'a 'a))
(gosh (eq? '1 (quote 1)))
(gosh (eq? '1 '1))
(gosh (eq? '1 1))
(gosh (eq? '(1) (quote (1))))
(gosh (eq? '(1) '(1)))
