(load-from-current-dirctory "include-gauche.scm")

; assq => eq?
; assoc => equal?
; assv => eqv?

;; 存在しない
;; (test-sequence
;;  #t (alist? '((a 1)))
;; )


(define a '((a 1) (b 2) (c 3)))
(define aa (assq 'a a))
(test-sequence aa '(a 1))
(test-sequence (assq 'NO a) #f)
; 上書き
(set-cdr! aa '(2))
(test-sequence (assq 'a a) '(a 2))

; pair
(define a '((a . 1) (b . 2) (c . 3)))
(define aa (assq 'a a))
(test-sequence aa '(a . 1))
(test-sequence (assq 'NO a) #f)
; 上書き
(set-cdr! aa '2)
(test-sequence (assq 'a a) '(a . 2))



(define table (make-hash-table 'eq?))

(hash-table-put! table 'test 1)

(print (hash-table-get table 'test))

; 存在しないものを参照するとエラー
; (hash-table-get table 'no-key)

; 初期値を与えることが可能
(hash-table-get table 'no-key 'default-value)


(ps "assq assv assoc")
(p "eq?")
(runD "(assq 'a '((a . 1) (b . 2) (c . 3)))")

(runD "(acons 'b  2 '((a . 1)))")

(runD "(assoc-ref '((a . 1)) 'a)")
(runD "(assoc-ref '((a . 1)) 'b)")
