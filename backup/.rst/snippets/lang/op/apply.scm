
(node "Math.min.apply(null, [1,2,-1,3])")

(gosh (apply + '(1 3 3)))
(gosh (apply + `,(list 1 (+ 1 2) 3)))
(gosh (apply + '(1 (+ 1 2) 3)) :warn "内側評価されない")
(gosh (apply + `,(1 (+ 1 2) 3)) :warn "1の関数が呼ばれてしまう")
(gosh (apply and '(#t #f)) :warn "特殊形式andにはapplyが使えない")

(emacs (+ 1 2))
(emacs (funcall '+ 1 2))
(emacs (apply '+ '(1 2)))
(emacs (apply '+ 1 '(2)))
(emacs (apply '+ 1 2 '()))
; (emacs (apply #'+ '(1 2)))
(emacs (apply (symbol-function '+) '(1 2)))
(emacs (apply (lambda (x y) (+ x y)) '(1 2)))
(emacs (apply '(lambda (x y) (+ x y)) '(1 2)))
; (emacs (apply #'(lambda (x y) (+ x y)) '(1 2)))
(emacs (apply + '(1 2)) :warn "function must be quoted")