; tmpfile作成

(gosh (receive (oport name) (sys-mkstemp "/tmp/test")))

(emacs (make-temp-name "/tmp/") :msg "just filename")

(emacs (with-temp-file "/tmp/hoge" (insert "hoge")))
