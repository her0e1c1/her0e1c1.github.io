(load-from-current-dirctory "include-gauche.scm")

(define (a)
  (define b 1)
  (define c 1)
  (set! b (+ b c))
  (+ b c)
  (set! c (+ b c 10)))
(a)


; syntax-error
;; toplevelにしか、defineは記述できない (set!はOK)
;; (define (a2)
;;   1
;;   (define b 1))
