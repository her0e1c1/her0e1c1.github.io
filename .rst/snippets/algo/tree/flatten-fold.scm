
(define (flatten tree)
  (fold (lambda (x acc)
          (append acc (if (pair? x)
                          (flatten x)
                          (list x))))
        '()
        tree))

(define t1 '(a (b (c d) e) (f g) h))

(print
(flatten t1)
)
