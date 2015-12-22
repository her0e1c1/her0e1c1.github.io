(defun echo()
  (print "echo"))

; afterを定義したので、(echo)を実行した後に呼びだされる
(defadvice echo (after after_echo activate)
  (print "after echo!"))

(with-output-to-string (echo))