
(pw "quoteの引数の数は、一つだけ ; 二つ以上とるとエラーになるので注意!")
(gosh (quote 1 2))

(gosh (call-with-values (lambda () (values 2 3)) (lambda (x y) (* x y)))
      :msg "1つ目の引数として取った手続きを引数無しで実行し、
返ってきた値(多値)を引数として2つ目の引数として取った手続きを実行します。")

;; (define values (lambda things
;;                  (call-with-current-continuation
;;                   (lambda (cont) (apply cont things)))))

;; (define (double-list x)
;;   (letrec ((dlist-iter
;;             (lambda (p q)
;;               (if (null? p)
;;                   q
;;                   (dlist-iter (cdr p) (append q (list (* 2 (car p)))))))))
;;     (dlist-iter x '())))

;; (double-list '(1 2 3)) ;  (2 4 6)


;; ; let FUNC ARGS BODY
;;  (let fact ((n 10))
;;    (if (= n 1)
;;        1
;;        (* n (fact (- n 1)))))


;; ; inner関数を定義するのがletrec
;; (letrec ((fact
;;           (lambda (n)
;;             (if (= n 1) 1
;;                 (* n (fact (- n 1)))))))
;;   (fact 10))


;; ;; BODYでない場所でfactを呼び出せない(再帰呼び出し不可)
;; ;; (let ((fact
;; ;;           (lambda (n)
;; ;;             (if (= n 1) 1
;; ;;                 (* n (fact (- n 1)))))))
;; ;;   (fact 10))


; like destructuring-bind in lisp
(match-let1 (a (b)) '(1 (2)) (+ a b))  ; 3
