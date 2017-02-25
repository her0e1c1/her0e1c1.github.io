
(run "python -c 'print([1,2,3][0])'")
(php "$arr = array(10, 20, 30, 40, 50); echo \"$arr[0]\";")

;; ghc -e 'head [1,2,3]'

(emacs (-first-item '(1 2 3)))
(emacs (car nil) :msg "No error if nil")
