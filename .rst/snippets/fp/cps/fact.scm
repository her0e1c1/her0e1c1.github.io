
; m is the result of "(fact (- n 1))"
; In "(count XXX)", XXX is the return value the func returns
(define (fact/cps n cont)
  (if (= n 1)
      (cont 1)
      (fact/cps (- n 1) (lambda (m) (cont (* n m))))))
