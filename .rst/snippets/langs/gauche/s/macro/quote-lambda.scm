
;;; マクロのサンプルテストコード

; mapと組み合わせるときは、lambdaのbodyに`をつけて、
; コードそのものと、それの評価値をそれぞれ取得できる
; なおmapが返す式には、iが存在しないので変数捕捉されることはない
(define-macro (test1 . body)
  `(begin ,@(map (lambda (i) `(print (format "~A => ~A" (quote ,i) ,i))) body)))
(test1 1 (+ 1 1) 3)


; applyに渡すリストの中身にリストがあってはならない
; そのため、一度全て評価したものを、再度リストにする
; つまり、(apply + '((+ 1 1) 3)) ではなく
; (apply + '(2 3)) として評価される
(define-macro (test1 . body)
  `(apply + (list ,@(map (lambda (i) `(+ ,i 0)) body))))
(eqt 6 (test1 1 (+ 1 1) 3))


; (+ (+ 1 1) 3) ではなく (+ 2 3)として評価
(define-macro (test1 . body)
  `(+ ,@(map (lambda (i) `(+ ,i 0)) body)))
(eqt 6 (test1 1 (+ 1 1) 3))
