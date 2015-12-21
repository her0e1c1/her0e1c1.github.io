(load-from-current-dirctory "include.scm")

; ''でくくると(quote )とバティングする!
; ""でくくると`が展開される
(define (run-gauche+ cmd)
  (let* ((p #"(print (begin ~cmd))")
         (e (quote-expression p :quote #\'))
         (c #"gosh -e ~e -Eexit"))
         (oneliner-run+ c)))

(define runS run-gauche+)

(define (run-gauche2 cmd)
  (let* ((p #"(print (begin ~cmd))")
         (e (quote-expression p :quote #\"))
         (c #"gosh -e ~e -Eexit"))
         (oneliner-run+ c)))

(define runD run-gauche2)


(define-macro (run-gauche++ cmd)
  `(let* ((p (format "(print (begin ~s))" ',cmd))
          (e (quote-expression p :quote #\'))
          (c #"gosh -e ~e -Eexit"))
     (oneliner-run+ c)))

(define runs run-gauche++)

;; (define-macro (run-gauche+++ cmd)
;;   `(let* ((e (quote-expression ,cmd :quote #\'))
;;           (c #"~e"))
;;      (oneliner-run+ c)))
(define s oneliner-run+)
