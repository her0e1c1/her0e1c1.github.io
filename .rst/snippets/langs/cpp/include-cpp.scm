(load-from-current-dirctory "include.scm")

(define run oneliner-run+)

(define (run+ cmd)
  (let* ((replaced (regexp-replace-all #/'/ cmd "'\\\\''"))
         (c #"cpe '~replaced'"))
    (oneliner-run+ c)))