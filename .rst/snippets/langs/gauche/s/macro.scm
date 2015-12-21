(load-from-current-dirctory "include-gauche.scm")

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
