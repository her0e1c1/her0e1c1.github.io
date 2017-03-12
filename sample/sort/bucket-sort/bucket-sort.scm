(define (repeat n x)
  (if (= n 0)
      '()
      (cons x (repeat (- n 1) x))))

(define (count n alist)
  (if (null? alist)
      0
      (+ (if (= n (car alist)) 1 0)
         (count n (cdr alist)))))

(define (sort alist max)
  (fold (lambda (x acc) (append acc (repeat (count x alist) x))) '() (iota max 0)))

(define (main args)
  (print (sort '(3 1 4 1 5 9 2 6 5 3 5 8 9) 10))  ; [1,1,2,3,3,4,5,5,5,6,8,9,9]
  0)
