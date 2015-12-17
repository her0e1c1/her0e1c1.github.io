(load-from-current-dirctory "include-gauche.scm")

; apply
(run "(apply + '(1 3 3))")
(run "(apply + \\`,(list 1 (+ 1 2) 3))")

; 内側評価されない
(run "(apply + '(1 (+ 1 2) 3))")

; 1の関数が呼ばれてしまう
(run "(apply + \\`,(1 (+ 1 2) 3))")

; WARN: 特殊形式andにはapplyが使えない
(run "(apply and '(#t #f))")

; (receive (a b) (values 1 2) (+ a b))  ; 3
