
(emacs "
; define a function named double
(defun double (x) (* x 2)) 
; define a variable named double
(setq double 2)
(print (double double))
"
:msg "Lisp has two name spaces for function and varable." :str #t)
