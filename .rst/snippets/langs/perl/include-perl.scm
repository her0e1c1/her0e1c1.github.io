(load-from-current-dirctory "include.scm")

(define (run+ cmd)
  (let* ((replaced (regexp-replace-all #/'/ cmd "'\\\\''"))
         (c #"perl -E '~replaced'"))
    (oneliner-run+ c)))

(define (run cmd)
  (let1 ret (oneliner-run cmd)
        (p (sphinx-block #"~cmd\n~ret" :code-block "sh"))))
