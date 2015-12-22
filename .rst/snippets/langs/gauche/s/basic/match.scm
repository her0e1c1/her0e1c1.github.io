
(use util.match)

; like destructuring-bind in lisp
(match-let1 (a (b)) '(1 (2)) (+ a b))  ; 3
