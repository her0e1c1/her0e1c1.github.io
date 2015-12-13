
(add-load-path "." :relative)
(load "fib.scm")
(use gauche.test)

; 0 1 2 3 4 5 6 7  8  9  10
; 0 1 1 2 3 5 8 13 21 34 55
(test* "(fib/cps 0)"  0   (fib/cps 0 values))
(test* "(fib/cps 1)"  1   (fib/cps 1 values))
(test* "(fib/cps 2)"  1   (fib/cps 2 values))
(test* "(fib/cps 8)"  21   (fib/cps 8 values))
(test* "(fib/cps 10)"  55   (fib/cps 10 values))
