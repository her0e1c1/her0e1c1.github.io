
(define (run cmd)
  (p (sphinx-block (format "$ ce '~a'\n~a" cmd (run-ce cmd)) :code-block "sh")))

(define ce run)

(define-macro (include+ path-list)
  `(begin ,@(map (lambda (p) `(include ,p)) path-list)))

(define (oneliner-run+ cmd)
  (let* ((rt (oneliner-run cmd)))
    (p (sphinx-block #"$ ~cmd\n~rt" :code-block "sh"))))

(define (run-c+ path . args)
  (let* ((cc (cmd-c path))
         (rt (oneliner-run cc)))
    (p (sphinx-block #"$ ~cc\n~rt" :code-block "sh"))))

(define (sphinx-block-c+ path)
  (let1 s (if (file-exists? path) (file->string path) path)
        (p (sphinx-block s :code-block "c"))))

(define-macro (run-c-from-string+ str)
  `(let* ((cmd (run-c-from-string ,str))
          (ret (sphinx-block (format "$ clang ~a && ./a.out\n~a" ',str cmd) :block #t))
          (code (sphinx-block (format "// ~a\n~a" ',str ,str) :code-block "c")))
     (print #"~code\n~ret")))

(define-macro (run-cpp-from-string+ str)
  `(let* ((cmd (run-cpp-from-string ,str))
          (ret (sphinx-block (format "$ clang++ ~a && ./a.out\n~a" ',str cmd) :block #t))
          (code (sphinx-block (format "// ~a\n~a" ',str ,str) :code-block "c++")))
     (print #"~code\n~ret")))

; for typeless
(define ps ($ print $ sphinx-section $))
(define pw ($ print $ sphinx-warn $))
(define ptodo ($ print $ sphinx-todo $))

(define (template$ str)
  (pa$ regexp-replace #/REPLACE/ str))

(define (template-map proc list template)
  (map (^x (proc ((template$ template) x))) list))



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
