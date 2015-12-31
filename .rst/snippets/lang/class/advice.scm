
(emacs (progn
 (defun echo() (print "echo"))
 (defadvice echo (after after-echo activate) (print "after echo!"))
 (echo))
:msg "afterを定義したので、(echo)を実行した後に呼びだされる")

;;; ad-do-it for around
(emacs (progn
  (defun f1() 1)
  (defadvice f1 (before before-f1 activate)
    (print "before")
    ad-return-value)
  (f1))
 :msg "")
