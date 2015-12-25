(require 'script "~/.emacs.d/lisp/script.el")

; defunはerror
(cl-defun add (&key (a 1) (b 2))
  (+ a b))
(add :a 3)  ; 5