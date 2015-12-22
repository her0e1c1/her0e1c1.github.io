(require 'script "~/.emacs.d/lisp/script.el")

; 文字列の左右の空白文字を除去
(princ-rest
(s-trim "  a  ")
(s-trim " a\n")
(s-trim " a\n\t")
)