(emacs (progn (with-temp-buffer (defvar a 1))  a))
(emacs (progn (set (make-local-variable 'a) 1) a)
       :msg "a local variable can't be referred in the other buffers")

