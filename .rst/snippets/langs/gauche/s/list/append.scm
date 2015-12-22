(load-from-current-dirctory "include.scm")

(ps "append!")

(p "末尾に要素を加える")
(rs (define a '(1 2)) (append! a '(3)))

(pw "NULLの場合は書き変わらないので注意")
(rs (define a '()) (append! a '(1)))
