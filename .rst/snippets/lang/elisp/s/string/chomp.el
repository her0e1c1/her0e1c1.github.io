(require 'script "~/.emacs.d/lisp/script.el")

; 文字列の末尾の空行を除去
(princ-rest
(s-chomp "ABC\n")

; 一つだけ除去
(s-chomp "ABC\n\n")

; ない場合は何もしない
(equal "ABC" (s-chomp "ABC"))