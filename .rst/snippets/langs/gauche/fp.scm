

; matchした要素だけ取得
(filter #/^..$/ (glob "*"))


; f g => (f (g x))
(define not-zero? (compose not zero?))
(not-zero? 3)

; bに結果が溜まる
; s '(fold (^(a b) (cons a b)) ''() (i 10))'



; s '(filter ($ not $ even? $) (i 10))'
; s '(filter (.$ not even?) (i 10))'

; ((pa$ flip map) (iota 10) print)

; s '($ p $ + 1 2 3)' => 6

(define values (lambda things
                 (call-with-current-continuation
                  (lambda (cont) (apply cont things)))))


(define (partition pred ls)
  (if (null? ls)
      (values '() '())
      (call-with-values
          (lambda ()
            (partition pred (cdr ls)))
        (lambda (a b)
          (if (pred (car ls))
              (values (cons (car ls) a) b)
              (values a (cons (car ls) b)))))))

1つ目の引数として取った手続きを引数無しで実行し、返ってきた値(多値)を引数として2つ目の引数として取った手続きを実行します。
(call-with-values (lambda () (values 2 3))
                    (lambda (x y) (* x y)))
