

(eof-object)
(values)

; inline ;; top level ;;; module level
#! comment
; comment
#| comment |#
#; (skip one) (+ 1 2)


(pw "quoteの引数の数は、一つだけ ; 二つ以上とるとエラーになるので注意!")
; (quote 1 2)  ; error!

(eq? '1 (quote 1))
(eq? '1 '1)
(eq? '1 1)

(eqt '(1) (quote (1)))
(eqt '(1) '(1))
