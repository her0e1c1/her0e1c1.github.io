
; 第一引数に関数
; 第二引数以降に関数の引数を指定

; 以下の置き換えを頭に入れておく
; (FUNC ARG1 ARG2 ... ARGN) => (funcall 'FUNC ARG1 ARG2 ... ARGN)

;; (princ-rest
;; (funcall '1+ 1)
;; (funcall '+ 1 2 3)
;; ; lambdaのときは、'をつける必要なし
;; (funcall (lambda (x y z) (+ x (* y z))) 1 2 3)
;; ; ただしつけても同じ動作する
;; (funcall '(lambda (x y z) (+ x (* y z))) 1 2 3)

;; ; 引数が期待される場合と異なるときはerror
;; ; (funcall '1+ 1 2)
