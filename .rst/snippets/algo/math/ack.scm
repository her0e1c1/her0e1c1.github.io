
(gosh #!Q
(define (ack m n)
  (cond ((= m 0) (+ n 1))
        ((= n 0) (ack (- m 1) 1))
        (else (ack (- m 1) (ack m (- n 1))))))

(print (ack 1 1))  ; 3
(print (ack 2 2))  ; 7
(print (ack 3 3))  ; 61
(print (ack 3 4))  ; 125
Q :str #t)
