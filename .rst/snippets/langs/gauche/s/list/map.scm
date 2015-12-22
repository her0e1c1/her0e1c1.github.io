(load-from-current-dirctory "include-gauche.scm")

(ps "map")

(rs (map cons '(1 2 3) '(4 5 6)))

(p "１つ以上のリストを引数に取れる")
(rs (map (lambda (x y) (+ x y)) '(1 2 3) '(4 5 6)))

(runD "(map + (iota 5) (iota 5))")
