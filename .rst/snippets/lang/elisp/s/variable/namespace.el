;Lisp has two name spaces for function and varable.

; define a function named double
(defun double (x) (* x 2)) 
; define a variable named double
(setq double 2)
(double double)  ; 4