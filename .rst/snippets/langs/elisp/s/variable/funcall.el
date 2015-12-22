;tag: funcall, warn
; If you assign lambda to a variable, you need to use funcall/apply to call the lambda.

; define a variable as lambda
(setq double-lambda (lambda (x) (* 2 x)))

; you can't call function below
; (double-lambda 2)
; so call like this
(funcall double-lambda 2)  ; 4