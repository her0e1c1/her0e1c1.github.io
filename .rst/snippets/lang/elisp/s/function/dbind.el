; 構造代入
(destructuring-bind (a (b c) (&key d f)) '(1 (2 3) (:d 1 :f 2))
  (list a b c d))