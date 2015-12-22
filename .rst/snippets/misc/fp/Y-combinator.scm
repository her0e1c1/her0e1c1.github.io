; Y combinator
; sicp 4.21

; inner関数がなくても、lambdaで内部関数定義できる

((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
          1
          (* k (ft ft (- k 1)))))))
         5)

((lambda (n)
           ((lambda (fact)
              (fact fact n))
            (lambda (ft a)
              (cond ((= a 0) 0)
                    ((= a 1) 1)
                    (else (+ (ft ft (- a 1))
                             (ft ft (- a 2))))))))
         10)

(begin (define (f x)
         ((lambda (even? odd?)
            (even? even? odd? x))
          (lambda (ev? od? n)
            (if (= n 0) true (od? ev? od? (- n 1))))
          (lambda (ev? od? n)
            (if (= n 0) false (ev? ev? od? (- n 1))))))
       (f 10))
