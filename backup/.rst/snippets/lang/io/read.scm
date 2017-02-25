
; # ~/.emacsを文字列で読み込む
(ghc "System.Directory.getHomeDirectory >>= \x -> return (x ++ \"/.emacs\") >>= readFile")

(emacs (f-read-text "~/.emacs"))
