(load-from-current-dirctory "include-gauche.scm")

(ps "and-let*")
(runD "(and-let* ((a 1) (b (+ a 1))) (+ a b))")
(runD "(and-let* ((a 1) (b #f)) (+ a b))")
