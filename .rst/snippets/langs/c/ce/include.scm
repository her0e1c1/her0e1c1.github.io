(define (run cmd)
  (p (sphinx-block (format "$ ce '~a'\n~a" cmd (run-ce cmd)) :code-block "sh")))

(define ce run)

(define-macro (include+ path-list)
  `(begin ,@(map (lambda (p) `(include ,p)) path-list)))
