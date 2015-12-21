(load-from-current-dirctory "include-gauche.scm")

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
