
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
