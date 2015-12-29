

(run "python -c 'print(any(i % 2 == 0 for i in [1,2,3]))'")

;; ghc -e 'any id [True,False,False]'
;; ghc -e 'any even [1,2,3]'

(emacs (--any? (evenp it) '(1 2 3)))
