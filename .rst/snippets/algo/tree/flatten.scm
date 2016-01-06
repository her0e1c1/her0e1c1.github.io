
(define (flatten tree)
  (cond ((null? tree) '())
         ((pair? tree)
          (append (flatten (car tree))
                  (flatten (cdr tree))))
         (else (list tree))))

(define t1 '(a (b (c d) e) (f g) h))
(print
(flatten t1)
)
