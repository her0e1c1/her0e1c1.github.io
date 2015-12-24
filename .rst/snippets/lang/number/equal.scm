
(ghc "(1::Int) == (1::Integer)")

(p "-eq, -gt, are operators for number. NOT STRING!")
(pw "[ and ] need spaces around each of them")
(sh "[ 1 -eq 1 ] && echo 'true'")
(sh "[ 2 -gt 1 ] && echo 'true'")
(sh "[ 2 -ge 2 ] && echo 'true'")
(sh "[ 1 -lt 2 ] && echo 'true'")
(sh "[ 2 -le 2 ] && echo 'true'")
(sh "[ 'hoge' -eq 'hoge' ] && echo 'true'")

(pw "Not == operator")
(sh "[ 'str' = 'str' ]     && echo 'true'")
(sh "[ 'str' != 'string' ] && echo 'true'")
(sh "[ 1 = 1 ]     && echo 'true'")

(p "Not quoted string")
(sh "[ hoge = hoge ]     && echo 'true'")


(ps "eqv?")
(p "シンボルと数値")
(gosh (eqv? '1 1))

(ps "=")
(p "数値同士の場合は=")
(gosh (= 1 1.0))
