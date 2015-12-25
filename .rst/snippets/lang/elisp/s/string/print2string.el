; 標準出力を文字列に変換
(require 'script "~/.emacs.d/lisp/script.el")

(princ-rest
(with-output-to-string 
  (princ "abc")
  (princ '("def"))
  (prin1 '("def"))
)
)