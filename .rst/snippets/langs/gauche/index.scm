(load-from-current-dirctory "include-gauche.scm")

(ps "apply")
(run "(apply + '(1 3 3))")
(run "(apply + \\`,(list 1 (+ 1 2) 3))")

; 内側評価されない
(run "(apply + '(1 (+ 1 2) 3))")

; 1の関数が呼ばれてしまう
(run "(apply + \\`,(1 (+ 1 2) 3))")

(pw "特殊形式andにはapplyが使えない")
(run "(apply and '(#t #f))")

(ps "recieve")
(run "(receive (a b) (values 1 2) (+ a b))")

; 衛生的マクロ(hygienic macro)

(ps "define-syntax")
(run "(define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 2)")
(run "(define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 10 20)")

(p "(literal ...)")
(p "HOGE becomes a keyword")
(run "(define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 HOGE)")
(run "(define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 H)")

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

;; (let ((f (lambda (x) (+ x 1))))
;;   (let-syntax ((f (syntax-rules ()
;;                     ((_ x) x)))
;;                (g (syntax-rules ()
;;                     ((_ x) (f x)))))
;;     (list (f 1) (g 1)))) <graphic> (1 2)

;; (let ((f (lambda (x) (+ x 1))))
;;   (letrec-syntax ((f (syntax-rules ()
;;                        ((_ x) x)))
;;                   (g (syntax-rules ()
;;                        ((_ x) (f x)))))
;;         (list (f 1) (g 1)))) <graphic> (1 1)
