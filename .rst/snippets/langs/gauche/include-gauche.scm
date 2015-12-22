(load-from-current-dirctory "include.scm")

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

(define-macro (run-gauche++ . cmds)
  `(let* ((cmd ,(string-join (map (^x (format "~s" x)) cmds) " "))
          (p (format "(print (begin ~a))" cmd))
          (e (quote-expression p :quote #\'))
          (c #"gosh -e ~e -Eexit"))
     (oneliner-run+ c)))

; (define rund run-gauche++)
(define runs run-gauche++)

(define s oneliner-run+)

(define-macro (runm str)
  `(let* ((ret (sphinx-block (run-gauche-from-string ,str) :code-block "sh"))
          (scmd (sphinx-block ,str :code-block "scheme")))
     (print #"~scmd\n~ret")))

(define rs runs)
