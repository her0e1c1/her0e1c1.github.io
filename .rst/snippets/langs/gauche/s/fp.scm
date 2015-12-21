(load-from-current-dirctory "include-gauche.scm")

(ps "filter")
(p "matchした要素だけ取得")
(filter #/^..$/ (glob "*"))
(filter ($ not $ even? $) (i 10))
(filter (.$ not even?) (i 10))

(ps "pairtial")
(p "f g => (f (g x))")
(runs ((compose not zero?) 0))
(runs ((compose not zero?) 1))
(runs ((pa$ not zero?) 1))
(runs ((pa$ flip map) (iota 10) print))

(ps "foldl")
(p "bに結果が溜まる")
(runs (fold (^(a b) (cons a b)) '() (i 10)))

(ps "composite function")
(runs ($ p $ + 1 2 3))

(p "1つ目の引数として取った手続きを引数無しで実行し、
返ってきた値(多値)を引数として2つ目の引数として取った手続きを実行します。")
(runs (call-with-values (lambda () (values 2 3)) (lambda (x y) (* x y))))

;; (define values (lambda things
;;                  (call-with-current-continuation
;;                   (lambda (cont) (apply cont things)))))

;; (define (partition pred ls)
;;   (if (null? ls)
;;       (values '() '())
;;       (call-with-values
;;           (lambda ()
;;             (partition pred (cdr ls)))
;;         (lambda (a b)
;;           (if (pred (car ls))
;;               (values (cons (car ls) a) b)
;;               (values a (cons (car ls) b)))))))
