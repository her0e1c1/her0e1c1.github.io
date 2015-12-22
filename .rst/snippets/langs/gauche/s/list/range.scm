(load-from-current-dirctory "include-gauche.scm")

(ps "range")

(p "vはloop変数みたいなもの0から4までの値が順次格納")
(rs (list-ec (:range v 5) v))

(ps "iota")
(rs (iota 10))
(rs (iota 10 5))
(rs (iota 10 5 2))
