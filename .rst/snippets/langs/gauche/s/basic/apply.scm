(load-from-current-dirctory "include-gauche.scm")

(ps "apply")
(runs (apply + '(1 3 3)))
(runs (apply + `,(list 1 (+ 1 2) 3)))

(p "内側評価されない")
(runs (apply + '(1 (+ 1 2) 3)))

(p "1の関数が呼ばれてしまう")
(runs (apply + `,(1 (+ 1 2) 3)))

(pw "特殊形式andにはapplyが使えない")
(runs (apply and '(#t #f)))
