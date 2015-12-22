; ->  は第一引数を省略
; ->> は最後の引数を省略
; --> はitで引数を明示

(->> (number-sequence 1 10) (--map (+ 1 it)) (--filter (evenp it)))  ;  (2 4 6 8 10) 
(->> '(1 2 3 4 5) (--filter (not (evenp it))))  ; (1 3 5)

(progn (setq a '((1 1 0) (1 0 1)) b (-> a (length) (1+) (-repeat 0))) (cons b (--map (cons 0 it) a)))