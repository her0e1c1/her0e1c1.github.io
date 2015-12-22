

;; 括弧がないと、関数fの引数が2つとる意味になる
;; f Just x = 1
;; f (Just x) = 1

;; (+) 1 -1    (+) 1 (-1)

;; (flip +)    (flip (+))  記号関数を引数にする場合、括弧が必要

;; let add :: Int -> Int -> Int; add x y = x + y in add 1 2
