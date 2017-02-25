
(p "遅延ペアと通常のペアを区別する方法はありません")
(gosh (cdr (lcons 1 (lcons 2 '()))) :warn "最後のは無視されるみたい？")
(gosh (llist* 1 (+ 1 1) 3 4))

(gosh (liota 10))
(gosh (lcons* 1 2 3 (print "HOGE") 5))

; TODO: lazy let*
; (llet* ((a 1) (b 2)) (if #t a b))  ; 必要になってから評価
