(load-from-current-dirctory "include.scm")

(define run oneliner-run+)
(define (run+ cmd)
  (let1 cmd+ (regexp-replace-all #/'/ cmd "\"")
        (oneliner-simple-run-print #"ruby -e '~cmd+'")))
