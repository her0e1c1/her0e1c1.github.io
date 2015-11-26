
(define (flatten/cps tree k)
  (cond ((null? tree) (k '()))
        ((pair? tree)
         (flatten/cps (car tree)
                      (lambda (r1)
                        (flatten/cps
                         (cdr tree)
                         (lambda (r2) (k (append r1 r2)))))))
        (else (k (list tree)))))

(define t1 '(a (b (c d) e) (f g) h))
(print
 (flatten/cps t1 values)
)
