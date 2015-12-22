; 最後のは無視されるみたい？
; 遅延ペアと通常のペアを区別する方法はありません。
;; (cdr (lcons 1 (lcons 2 '())))
;; (llist* 1 (+ 1 1) 3 4)
(runD "(liota 10)")
; (df a (lcons* 1 2 3 (sys-sleep 10) 5))

; TODO: lazy let*
; (llet* ((a 1) (b 2)) (if #t a b))  ; 必要になってから評価
