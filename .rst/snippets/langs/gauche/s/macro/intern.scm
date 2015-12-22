
; internという関数は存在しない

(define (f) 1)
(define (g x) (+ x 1))

; 文字列から関数呼び出し
; evalは２つ引数が必要で、以下のを渡しておく
; 戻り値は関数なので、さらに関数呼び出しする
(test-sequence
 1 ((eval (string->symbol "f") (interaction-environment)))
 1 ((eval (string->symbol "f") '()))

 2 ((eval (string->symbol "g") (interaction-environment)) 1)
 2 ((eval (string->symbol "g") '()) 1)
)
