
; ,をつかうと、その変数の、そのままのコードに置き換わる
; ,@をつかうと、外側の括弧一つ取り除いたコードに置き換わる
; そしてmacroは最後の式を評価する
; なので、ネストした括弧を評価できるのは、eval時のみ(つまり、コードの置き換え中は無理)

; 引数のコードを取得するには、,と,@の内側かそもそも`と'を使わないの２択

(define-macro (test0 . lst) lst)
(eqt 6 (test0 + (+ 1 2) 3))

; lstが見つからない
(define-macro (test0 . lst) 'lst)
(eqt (test-error) (test0 + (+ 1 2) 3))

; lstが見つからない
(define-macro (test0 . lst) `lst)
(eqt (test-error) (test0 + (+ 1 2) 3))


(define-macro (test0 . lst) `'lst)
(eqt 'lst (test0 + (+ 1 2) 3))


(define-macro (test0 . lst) `,lst)  ; ok
(eqt 6 (test0 + (+ 1 2) 3))

(test-section "5")

(define-macro (test0 . lst) `',lst)
(eqt '(+ (+ 1 2) 3) (test0 + (+ 1 2) 3))

;; error (quoteの引数が１でない)
;; (define-macro (test0 . lst) `',@lst)
;; (eqt #f (test0 + (+ 1 2) 3))


(define-macro (test0 . lst) `(,@lst))  ; ok
(eqt 6 (test0 + (+ 1 2) 3))


(define-macro (test0 . lst) `(list ,lst))
(eqt '(6) (test0 + (+ 1 2) 3))


(define-macro (test0 . lst) `'(list ,lst))
(eqt '(list (+ (+ 1 2) 3)) (test0 + (+ 1 2) 3))

(define-macro (test0 . lst) `(list ,@lst))
(eqt `(,+ 3 3) (test0 + (+ 1 2) 3))


(define-macro (test0 . lst) `'(list ,@lst))
(eqt '(list + (+ 1 2) 3) (test0 + (+ 1 2) 3))



;;; error
; (define (test lst) `,@lst)
; (define (test lst) ',@lst)

; 関数かつ１引数の場合は、内側を評価できない

(define (test0 lst) lst)  ; ok
(eqt '(1 (+ 1 2) 3) (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) 'lst)
(eqt 'lst (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) `lst)
(eqt 'lst (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) `'lst)
(eqt ''lst (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) `,lst)  ; ok
(eqt '(1 (+ 1 2) 3) (test0 '(1 (+ 1 2) 3)))

(test-section "5")

(define (test0 lst) `',lst)
(eqt ''(1 (+ 1 2) 3) (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) `',@lst)
(eqt '(quote 1 (+ 1 2) 3) (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) `(,@lst))  ; ok
(eqt '(1 (+ 1 2) 3) (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) `(list ,lst))
(eqt '(list (1 (+ 1 2) 3)) (test0 '(1 (+ 1 2) 3)))


(define (test0 lst) `(list ,@lst))  ; ok
(eqt '(list 1 (+ 1 2) 3) (test0 '(1 (+ 1 2) 3)))



; . を使う場合は、リストの中身が呼び出し側で評価されている

(define (test0 . lst) lst)  ; ok
(eqt '(1 3 3) (test0 1 (+ 1 2) 3))


(define (test0 . lst) 'lst)
(eqt 'lst (test0 1 (+ 1 2) 3))


(define (test0 . lst) `lst)
(eqt 'lst (test0 '1 (+ 1 2) 3))


(define (test0 . lst) `'lst)
(eqt ''lst (test0 1 (+ 1 2) 3))


(define (test0 . lst) `,lst)  ; ok
(eqt '(1 3 3) (test0 1 (+ 1 2) 3))

(test-section "5")

(define (test0 . lst) `',lst)
(eqt ''(1 3 3) (test0 1 (+ 1 2) 3))


(define (test0 . lst) `',@lst)
(eqt '(quote 1 3 3) (test0 1 (+ 1 2) 3))


(define (test0 . lst) `(,@lst))  ; ok
(eqt '(1 3 3) (test0 1 (+ 1 2) 3))


(define (test0 . lst) `(list ,lst))
(eqt '(list (1 3 3)) (test0 1 (+ 1 2) 3))


(define (test0 . lst) `(list ,@lst))  ; ok
(eqt '(list 1 3 3) (test0 1 (+ 1 2) 3))


`(a b ,c (',(+ a b c)) (+ a b) 'c '((,a ,b)))
(A B 3 ('6) (+ A B) 'C '((1 2)))

1個のカンマは1個の逆クォートの効果を打ち消す
