
(defun add (&rest body)
  (apply '+ body))

; body == '(1 2 3)
(add 1 2 3)  ; 6

; You can't use &body in elisp
; (defun f (&body body) ...)