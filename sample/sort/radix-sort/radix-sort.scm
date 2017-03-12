
; limit is max digit = 10^limit
(define (sort alist limit)
  (fold (lambda (l acc)
          (apply append
                 (map (lambda (d)
                        (filter (lambda (a) (= d (mod (div a (expt 10 l)) 10))) acc))
                  (iota 10 0))))
        alist
        (iota limit 0)))

(define (main args)
  (print (sort '(170 45 75 90 2 24 802 66) 4))
  (print (sort '(0 1 2 3 4 5 6 7 8 9 6 5 4 3 6 5 4 3 10 9 8 7 6 5 4 3 2 1 0) 3))
  0)
