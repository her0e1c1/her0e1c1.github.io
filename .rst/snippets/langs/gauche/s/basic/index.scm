(load-from-current-dirctory "include-gauche.scm")

(pw "quoteの引数の数は、一つだけ ; 二つ以上とるとエラーになるので注意!")
(runs (quote 1 2))

(ps "recieve")
(runs (receive (a b) (values 1 2) (+ a b)))
