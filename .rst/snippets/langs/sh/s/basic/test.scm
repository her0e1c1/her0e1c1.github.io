(load-from-current-dirctory "include-sh.scm")

(ps "Compare")

(p "-eq, -gt, are operators for number. NOT STRING!")
(pw "[ and ] need spaces around each of them")
(run "[ 1 -eq 1 ] && echo 'true'")
(run "[ 2 -gt 1 ] && echo 'true'")
(run "[ 2 -ge 2 ] && echo 'true'")
(run "[ 1 -lt 2 ] && echo 'true'")
(run "[ 2 -le 2 ] && echo 'true'")
(run "[ 'hoge' -eq 'hoge' ] && echo 'true'")

(pw "Not == operator")
(run "[ 'str' = 'str' ]     && echo 'true'")
(run "[ 'str' != 'string' ] && echo 'true'")
(run "[ 1 = 1 ]     && echo 'true'")

(p "Not quoted string")
(run "[ hoge = hoge ]     && echo 'true'")
