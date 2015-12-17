(load-from-current-dirctory "include.scm")

; ''でくくると(quote )とバティングする!
; ""でくくると`が展開される
(define (run-gauche+ cmd)
  ; (let1 c #"gosh -e '(print (begin ~cmd))' -Eexit"
  (let1 c #"gosh -e \"(print (begin ~cmd))\" -Eexit"
        (oneliner-run+ c)))

(define run run-gauche+)
