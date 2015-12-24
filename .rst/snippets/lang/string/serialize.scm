
(p "オブジェクトを文字列にする")
(gosh (write-to-string '(1 foo "abc")))
(gosh (read-from-string "(1 foo \"abc\")"))
