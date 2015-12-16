
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

