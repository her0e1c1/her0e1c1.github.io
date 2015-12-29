
(python "for i in range(3): print(i)")

(gosh (list-ec (:range v 5) v)
      :msg "vはloop変数みたいなもの0から4までの値が順次格納")
(gosh (iota 10))
(gosh (iota 10 5))
(gosh (iota 10 5 2))

(emacs (number-sequence 1 10))
