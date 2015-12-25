;; (define-syntax if-let1
;;   (syntax-rules ()
;;     ((_ var test then else)
;;           (or (and-let* ((var test)) then) else))))

(p "衛生的マクロ(hygienic macro)")
(ps "define-syntax")
(runs (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 2))
(runs (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 10 20))

(p "(literal ...)")
(p "HOGE becomes a keyword")
(runs (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 HOGE))
(runs (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 H))


;; ; 関数にすると、ローカル変数に代入する意味のないものになる
;; ;; (define-macro (null! x)
;; ;;   (guard (_ (else `(define ,x '())))
;; ;;           x `(set! ,x '())))

;; (define-syntax while
;;   (syntax-rules ()
;;     ((while condition body ...)
;;      (let loop () (if condition (begin body ... (loop)))))))
;; (let1 a 10 (while (> a 0 ) (print a) (set! a (- a 1))))

;; (define-syntax for
;;   (syntax-rules (in as)
;;     ((for element in list body ...)
;;      (map (lambda (element) body ...) list))
;;     ((for list as element body ...)
;;           (for element in list body ...))))

(ps "let-syntax")
(runs
(let ((f (lambda (x) (+ x 1))))
  (let-syntax ((f (syntax-rules ()
                    ((_ x) x)))
               (g (syntax-rules ()
                    ((_ x) (f x)))))
    (list (f 1) (g 1))))
)
(runs
(let ((f (lambda (x) (+ x 1))))
  (letrec-syntax ((f (syntax-rules ()
                       ((_ x) x)))
                  (g (syntax-rules ()
                       ((_ x) (f x)))))
        (list (f 1) (g 1))))
)
