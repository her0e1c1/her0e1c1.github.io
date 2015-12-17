
(define (merge-sort alist)
  (cond ((null? alist) '())
        ((= (length alist) 1) alist)
        (else
         (let ((mid (div (length alist) 2)))
           (merge (merge-sort (take alist mid)) (merge-sort (drop alist mid)))))))

(define (merge l r)
  (cond ((null? l) r)
        ((null? r) l)
        (else
         (let ((la (car l)) (ra (car r)))
           (if (< la ra)
               (cons la (merge (cdr l) r))
               (cons ra (merge l (cdr r))))))))

(define (main args)
  (print (merge-sort '(1 4 1 5 2 3 1)))
  (print (merge-sort '(5 2 3 1)))
  (print (merge-sort '(1)))
  (print (merge-sort '()))
  0)

  
