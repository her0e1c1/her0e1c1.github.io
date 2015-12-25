

(ps "and-let*")
(gosh "(and-let* ((a 1) (b (+ a 1))) (+ a b))")
(gosh "(and-let* ((a 1) (b #f)) (+ a b))")


(ps "match")
(match-let1 (a (b)) '(1 (2)) (+ a b))


(ps "let-*")
(gosh
 (let fact ((n 10))
   (if (= n 1)
       1
       (* n (fact (- n 1))))))
(gosh
 (letrec ((fact
          (lambda (n)
            (if (= n 1) 1
                (* n (fact (- n 1)))))))
   (fact 10)))
(gosh
 (let ((fact
        (lambda (n)
          (if (= n 1) 1
              (* n (fact (- n 1)))))))
   (fact 10)))
