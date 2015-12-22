; Apply needs first argment as function and second argument as list.
; Or it needs last argument as list.


; these functions return 3
(+ 1 2)
(funcall '+ 1 2)

(apply '+ '(1 2))
(apply '+ 1 '(2))
(apply '+ 1 2 '())
(apply #'+ '(1 2))
(apply (symbol-function '+) '(1 2))

; you can write lambda function in 3 ways
(apply (lambda (x y) (+ x y)) '(1 2))
(apply '(lambda (x y) (+ x y)) '(1 2))
(apply #'(lambda (x y) (+ x y)) '(1 2))

; function must be quoted
;(apply + '(1 2))  ; error

; the last argument must be list
;(apply '+ 1 2)  ; error

; 内側が評価されないのでエラー
(apply '+ '(1 (+ 1 2) 3))

; ok
(apply '+ `,(list 1 (+ 1 2) 3))


; other samples
(apply 'min '(1 2 -1 3))  ; -1
