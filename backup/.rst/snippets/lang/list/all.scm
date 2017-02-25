
(run "python -c 'print(all(i % 2 == 0 for i in [0,2,4]))'")

(ghc "all even [0,2,4]")

(emacs (--all? (evenp it) '(0 2 4)))
