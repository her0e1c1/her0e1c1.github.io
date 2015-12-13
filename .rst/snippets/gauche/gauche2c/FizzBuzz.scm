(.include <stdio.h>)

(define-cfn main (argc::int argv::char**) ::int
  (dotimes (i 30)
           (case (% (+ i 1) 15)
             ((0) (printf "FizzBuzz\n"))
             ((3 6 9 12) (printf "Fizz\n"))
             ((5 10) (printf "Buzz\n"))
             (else (printf "%d\n" (+ i 1)))))
  (return 0))
