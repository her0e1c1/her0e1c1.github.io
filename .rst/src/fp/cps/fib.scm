
(define (fib/cps n k)
  (cond ((= n 0) (k 0))
        ((= n 1) (k 1))
        (else (fib/cps (- n 1) (lambda (r1)
                                 (fib/cps (- n 2) (lambda (r2)
                                                    (k (+ r1 r2)))))))))

(print
 (fib/cps 10 values)
)
