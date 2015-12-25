; caskでインストールしたファイルのパスは
; (cask-initialize)を実行することで設定される

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(princ "Load yasnippet ... ")
(require 'yasnippet)
(princ "Done\n")