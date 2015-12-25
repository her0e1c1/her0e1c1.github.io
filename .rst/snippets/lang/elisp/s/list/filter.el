;tag: anaforic
(require 'script "~/.emacs.d/lisp/script.el")

(princ-rest

; 条件に合致したら、残す
(--remove (evenp it) '(1 2 3 4 5))  ; (1 3 5)

; 条件に合致したら、除外
(--filter (evenp it) '(1 2 3 4 5))  ; (2 4)

(remove-if #'evenp '(1 2 3 4 5))  ; (1 3 5)

)