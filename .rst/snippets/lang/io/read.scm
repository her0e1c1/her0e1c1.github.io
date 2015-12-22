
# ~/.emacsを文字列で読み込む
ghc -e 'System.Directory.getHomeDirectory >>= \x -> return (x ++ "/.emacs") >>= readFile'
