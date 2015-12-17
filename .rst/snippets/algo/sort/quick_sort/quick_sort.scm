
(define (quick-sort alist)
  (if (null? alist)
      '()
  (let* ((pivot (car alist))
         (rest (cdr alist))
         (small (filter (lambda (x) (<= x pivot)) rest))
         (large (filter (lambda (x) (> x pivot)) rest)))
    (append (quick-sort small) (list pivot) (quick-sort large)))))

; partitionで明確に仕切らずに、一方に寄せてあればOK
(define (quick-sort2 alist)
  (if (null? alist)
      '()
  (let* ((pivot (car alist))
         (small (filter (lambda (x) (<= x pivot)) alist))
         (large (filter (lambda (x) (> x pivot)) alist)))
    (append (quick-sort small) (quick-sort large)))))

(print (quick-sort '(5 2 1 4 3)))
(print (quick-sort '(1)))
(print (quick-sort '(3 2 1)))
