
(ghc "read \"10\"")
(ghc "reads \"10\"")
(ghc "reads \"10\" :: [(Int, String)]" :msg "型を指定する必要あり")
(run "ghc -e 'print(read \"10\" :: Integer)'")


(p "文字列を数値に変換する")
(node "Number('123')")
(node "parseInt('123', 10)")
(node "parseFloat('123')")
(node "parseInt('100px'.replace('px', ''))")

(node "1 + (+ '22')")
(node "'100' | 0")

(p "perlの場合文字列を+で評価すると型を数値とする
なお、文字列の結合は.を使うので注意
また、数値でないものは0として扱われる")
(run "perl -E 'say \"1\" + \"2\"'")
(run "perl -E 'say \"a1a\" + \"2\"'")

(emacs (prefix-numeric-value 10))
(emacs (prefix-numeric-value -5))
(emacs (prefix-numeric-value 10.0))
(emacs (prefix-numeric-value -5.0))
(emacs (prefix-numeric-value "10"))
(emacs (prefix-numeric-value "asdf"))
(emacs (prefix-numeric-value '(10 20 30)))
