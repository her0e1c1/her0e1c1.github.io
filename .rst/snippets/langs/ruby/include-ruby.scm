(load-from-current-dirctory "include.scm")

(define run oneliner-run+)
(define (run+ cmd)
  (let1 cmd+ (quote-single->double cmd)
        (oneliner-simple-run-print #"ruby -e '~cmd+'")))
