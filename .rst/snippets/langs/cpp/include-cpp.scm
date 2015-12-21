(load-from-current-dirctory "include.scm")

(define run oneliner-run+)

(define (run+ cmd)
  (let* ((replaced (escape-single-quote cmd))
         (c #"cpe '~replaced'"))
    (oneliner-run+ c)))
