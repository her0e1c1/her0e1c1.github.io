
(ps "Gauss == floor")
(math "$lfloor x $rfloor $leqq x < $lfloor x $rfloor + 1")
(math "x-1 < [x] $leqq x")


;; //演算子について
;; ----------------
;; 割り切れない場合は、小数点以下を切り捨てる ::

;;    5 // 2 = 2
;;    1 // 10 = 0

;; 分配法則が成り立つ ::

;;    (A + B) // C = A // C + B // C

;; 0<= i < N の場合 ::

;;     i // N = 0

;; 一般に ::

;;     (N * i) // N = i
