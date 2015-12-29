
(emacs (progn
 (defun echo() (print "echo"))
 (defadvice echo (after after_echo activate) (print "after echo!"))
 (echo))
:msg "afterを定義したので、(echo)を実行した後に呼びだされる")
