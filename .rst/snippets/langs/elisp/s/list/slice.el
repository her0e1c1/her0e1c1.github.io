(require 'script "~/.emacs.d/lisp/script.el")

(princ-rest
(subseq '(1 2 3) 0)  ; '(1 2 3)
(subseq '(1 2 3) 1 2)  ; (2)
(subseq '(1 2 3) 1 3)  ; (2 3)
(subseq '(1 2 3) 1 5)  ; (2 3 nil nil)

(-slice '(1 2 3 4 5) 2 4)
(-slice '(1 2 3 4 5) 1)
(-slice '(1 2 3 4 5) -1)

)