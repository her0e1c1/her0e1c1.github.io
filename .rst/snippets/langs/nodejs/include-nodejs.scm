(load-from-current-dirctory "include.scm")

(define (run-nodejs+ cmd)
  (let* ((c #"node -e 'console.log(~cmd);'"))
    (oneliner-run+ c)))

(define run run-nodejs+)
