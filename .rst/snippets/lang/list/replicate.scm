

(run "python -c 'print([1] * 3)'")
(run "python -c 'print([1,2,3] * 3)'")


;; ghc -e 'replicate 3 1'


(emacs (-repeat 3 1))  ; (1 1 1)
