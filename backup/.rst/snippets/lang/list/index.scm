

(emacs (elt '(1 2 3) 0))
(emacs (elt '(1 2 3) 1))
(emacs (elt '(1 2 3) 3) :msg "範囲外の場合はnil")

(py "P([1,2,3][0])")
(ghc "[1..3] !! 0")