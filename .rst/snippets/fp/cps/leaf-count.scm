
(define (leaf-count/cps tree k)
  (if (pair? tree)
      (leaf-count/cps (car tree) (lambda (n)
                        (leaf-count/cps (cdr tree) (lambda (m) (k (+ n m))))))
      (k 1)))
