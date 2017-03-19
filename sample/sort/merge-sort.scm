
(define (merge-sort alist)
  (if (>= 1 (length alist))
      alist
      (let1 mid (div (length alist) 2)
            (merge (merge-sort (take alist mid)) (merge-sort (drop alist mid))))))

(define (merge l r)
  (cond ((null? l) r)
        ((null? r) l)
        (else
         (let ((la (car l)) (ra (car r)))
           (if (< la ra)
               (cons la (merge (cdr l) r))
               (cons ra (merge l (cdr r))))))))

(print (merge-sort '(1 4 1 5 2 3 1)))
