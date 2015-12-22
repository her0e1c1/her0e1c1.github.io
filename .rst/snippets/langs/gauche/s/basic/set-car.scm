
; 基本イメージ
; set-car! -> caXr
; set-cdr! -> cdXr

; ((1 . 2) (3 . 4))に (5 . 6)を代入したい

; 上手くいかない
(define a '((1 . 2) (3 . 4)))
(define a1 (cons '(5 . 6) a))
(print a1)
(set-car! a a1)
(print a)  ; #0=(((5 . 6) . #0#) (3 . 4))

; 破壊的な場合、先頭に代入できない
(define b '((1 . 2) (3 . 4)))
(set-cdr! b (cons '(5 . 6) (cdr b)))
(print b)

; 破壊的に先頭に代入したい場合
;; (define a '((1 . 2) (3 . 4)))
;; (append! a)

; mapで再構築したあとに上書き
(define a '((1 . 2) (3 . 4)))
(define amap (map cdr a))  ; (2 4)
(set-car! amap 20)
(set-car! (cdr amap) 40)

(test-sequence '(20 40) amap)
; mapで新しいlistを生成しているのでaは書きかわらない
(test-sequence '((1 . 2) (3 . 4)) a)

; (a b c) -> (a c)
(define a '(a b c))
(set-cdr! a (cddr a))
(test-sequence '(a c) a)

; (pop 0)
; (a b c) -> (b c)
(define a '(a b c))
(set-car! a (cadr a))
(set-cdr! a (cddr a))
(test-sequence '(b c) a)

; error(無限ループ)
; (define a '(a b c))
; (append! a (cdr a))
