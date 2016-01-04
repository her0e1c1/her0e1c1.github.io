(p "(1 1 1) (2 3 4) => (3 4 5)のように、左側を一桁とした足し算")

(gosh #!Q
; point: 空かそうでない場合をnext-Xとしておく
(define (add list1 list2)
  (let loop ((a list1) (b list2) (carry 0))
    (let* ((sum (+ (if (null? a) 0 (car a))
                   (if (null? b) 0 (car b))
                   carry))
           ; 0 <= sum <= 9 + 9 + 1 = 19
           (digit (mod sum 10))
           (next-carry (if (>= sum 10) 1 0))
           (next-a (if (null? a) '() (cdr a)))
           (next-b (if (null? b) '() (cdr b))))
      (cond ((and (null? a) (null? b))
             (if (= carry 1) '(1) '()))
            (else (cons digit (loop next-a next-b next-carry)))))))

(define (main args)
  (print (add '(1 2 3 4 5) '(5 4 3 2 1)))
  (print (add '(7 7 7) '(3 2 2)))
  (print (add '(7 7 7) '(3)))
  (print (add '() '()))
  (print (add '() '(1 2 3)))
  0)
Q :str #t)
