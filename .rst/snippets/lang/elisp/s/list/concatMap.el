
(require 'script "~/.emacs.d/lisp/script.el")

; 何かのライブラリ読み込んだら、mapcan使えるみたい

(princ-rest
(mapcan (lambda (x) (list x (* x x))) '(1 2 3))  ; (1 1 2 4 3 9)
(cl-mapcan (lambda (x) (list x (* x x))) '(1 2 3))  ; (1 1 2 4 3 9)
)

; eval and emacs freezes (Don't eval this code!)
; (mapcan (lambda (x) '(x)) '(1 2 3))

; ok
; (mapcan (lambda (x) (list x)) '(1 2 3))