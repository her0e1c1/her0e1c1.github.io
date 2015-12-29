

(run "python -c 'print(1 in [1,2,3])'")
(run "ghc -e 'elem 1 [1,2,3]'")
(run "perl -E 'say 1 if 1 ~~ [1,2,3]'")


(emacs (-contains? '(1 2 3) 1))
(emacs (-contains? '(1 2 3) 0))
(emacs (member 'd '(b c d e f)) :msg "マッチした要素以降を返す")
(emacs (member 'a '(b c d e f)))
