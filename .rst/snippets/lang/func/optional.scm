
(gosh (begin (define add (a :optional b (c 3)) (+ a b c)) (add 1 2)))
(emacs (progn (cl-defun add (a &optional b (c 3)) (+ a b c)) (add 1 2))
       :msg "clをloadすればcl-の接頭辞不要")
(py "add=lambda a,b,c=3:a+b+c; P(add(1,2))")
