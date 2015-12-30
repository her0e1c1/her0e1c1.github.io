
(gosh (path-extension "/path/to/text.txt"))
(gosh (path-extension "/foo/bar.c.a") :msg "parse only one dot")

(emacs (f-ext "/root/file/text.txt"))
(emacs (f-ext "/root/file/text.tar.gz"))


; exchange
(gosh (path-swap-extension "/path/to/text.txt" "csv"))
(gosh (path-swap-extension "/path/to/text.txt" #f))
