(define-syntax if-let1
  (syntax-rules ()
    ((_ var test then else)
          (or (and-let* ((var test)) then) else))))
