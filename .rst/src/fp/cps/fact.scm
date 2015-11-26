
(define (fact/cps n count)
  (if (= n 1)
      (count 1)
      ; m is the result of "(fact (- n 1))"
      ; In "(count XXX)", XXX is the return value the func returns
      (fact/cps (- n 1) (lambda (m) (count (* n m))))))
