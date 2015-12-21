(load-from-current-dirctory "include-gauche.scm")

(runs (eof-object))
(runs (values))

(runs "#| comment |#")
(runs "; inline ;; top level ;;; module level")
; #; (skip one) (+ 1 2)

(pw "quoteの引数の数は、一つだけ ; 二つ以上とるとエラーになるので注意!")
(runs (quote 1 2))

(ps "eq?")
(runs (eq? '1 (quote 1)))
(runs (eq? '1 '1))
(runs (eq? '1 1))
(runs (eq? '(1) (quote (1))))
(runs (eq? '(1) '(1)))


(ps "apply")
(runs (apply + '(1 3 3)))
(runs (apply + `,(list 1 (+ 1 2) 3)))

(p "内側評価されない")
(runs (apply + '(1 (+ 1 2) 3)))

(p "1の関数が呼ばれてしまう")
(runs (apply + `,(1 (+ 1 2) 3)))

(pw "特殊形式andにはapplyが使えない")
(runs (apply and '(#t #f)))

(ps "recieve")
(runs (receive (a b) (values 1 2) (+ a b)))
