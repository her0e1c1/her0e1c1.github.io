; caskをパスを指定してロードすれば、
; 合わせて以下のモジュールをロードしたことになる
; '(s dash f commander git epl shut-up cl-lib package-build)
(require 'cask "~/.cask/cask.el")

; 以下を明示的に呼び出す必要はない
; (require 'f)
(princ (-sum '(1 2 3)))

; これは呼び出せない
; (require 'yasnippet)