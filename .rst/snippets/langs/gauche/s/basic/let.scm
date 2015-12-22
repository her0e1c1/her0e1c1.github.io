
(define (double-list x)
  (letrec ((dlist-iter
            (lambda (p q)
              (if (null? p)
                  q
                  (dlist-iter (cdr p) (append q (list (* 2 (car p)))))))))
    (dlist-iter x '())))

(double-list '(1 2 3)) ;  (2 4 6)


; let FUNC ARGS BODY
 (let fact ((n 10))
   (if (= n 1)
       1
       (* n (fact (- n 1)))))


; inner関数を定義するのがletrec
(letrec ((fact
          (lambda (n)
            (if (= n 1) 1
                (* n (fact (- n 1)))))))
  (fact 10))


;; BODYでない場所でfactを呼び出せない(再帰呼び出し不可)
;; (let ((fact
;;           (lambda (n)
;;             (if (= n 1) 1
;;                 (* n (fact (- n 1)))))))
;;   (fact 10))
