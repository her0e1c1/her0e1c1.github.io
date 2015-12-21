(load-from-current-dirctory "include-gauche.scm")

(ps "assq assv assoc")
(p "eq?")
(runD "(assq 'a '((a . 1) (b . 2) (c . 3)))")

(runD "(acons 'b  2 '((a . 1)))")

(runD "(assoc-ref '((a . 1)) 'a)")
(runD "(assoc-ref '((a . 1)) 'b)")

(ps "and-let*")
(runD "(and-let* ((a 1) (b (+ a 1))) (+ a b))")
(runD "(and-let* ((a 1) (b #f)) (+ a b))")


(runD "(iota 10)")
(runD "(iota 10 5)")
(runD "(iota 10 5 2)")
(runD "(map + (iota 5) (iota 5))")

; 最後のは無視されるみたい？
; 遅延ペアと通常のペアを区別する方法はありません。
;; (cdr (lcons 1 (lcons 2 '())))
;; (llist* 1 (+ 1 1) 3 4)
(runD "(liota 10)")
; (df a (lcons* 1 2 3 (sys-sleep 10) 5))

; TODO: lazy let*
; (llet* ((a 1) (b 2)) (if #t a b))  ; 必要になってから評価
