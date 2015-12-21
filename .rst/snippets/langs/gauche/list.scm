
; assq assv assoc
(assq 'a '((a . 1) (b . 2) (c . 3)))  ; (a . 1)
(acons 'b  2 '((a . 1)))  ; ((b . 2) (a . 1))
(assoc-ref '((a . 1)) 'a)  ; 1
(assoc-ref '((a . 1)) 'b)  ; #f

(and-let* ((a 1) (b (+ a 1))) (+ a b))  ; 3
(and-let* ((a 1) (b #f)) (+ a b))  ; #f


; 最後のは無視されるみたい？
; 遅延ペアと通常のペアを区別する方法はありません。
(cdr (lcons 1 (lcons 2 '()))) ; (2)

; lcons*も同等
(llist* 1 (+ 1 1) 3 4)  ;(1 2 3)

(iota 10)  ; (0 1 2 3 4 5 6 7 8 9)
(liota 10) ;(0 1 2 3 4 5 6 7 8 9)
(map + (iota 5) (iota 5))  ; (0 2 ... 8)

; (df a (lcons* 1 2 3 (sys-sleep 10) 5))
; size-of
;; (define (len obj)
;;   (cond
;;    ((string? obj) (string-length obj))
;;    ((pair? obj) (length obj))
;;    (else 0)))

; TODO: lazy let*
; (llet* ((a 1) (b 2)) (if #t a b))  ; 必要になってから評価
