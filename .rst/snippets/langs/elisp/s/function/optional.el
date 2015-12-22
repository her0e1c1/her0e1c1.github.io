;;; 関数呼び出し時に必ずしも引数を必要としない
(require 'script "~/.emacs.d/lisp/script.el")


; 何も指定しない場合の初期値はnil
(defun add1 (a &optional b)
  (+ a (or b 1)))

; 初期値の指定可能
; 'clをloadすればcl-の接頭辞不要
(cl-defun add10 (a &optional (b 10))
  (+ a b))

(princ-rest

(add1 2)
(add1 2 10)

(add10 2)
(add10 2 10)

)