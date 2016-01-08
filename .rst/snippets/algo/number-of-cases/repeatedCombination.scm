(p "異なるn個の中から重複を許してr個取り出す場合の数(nHr)")

(p"同じものを使い続けるか、それを使わずに次へいくか
combinationとの違いは、使用しても消費しない")

(math "
H(n, 0) &=& ${ $phi $}
H(0, r) &=& $phi
H(n, r) &=& ${cons(a_n, x) $mid x $in H(n, r-1) $} $cup H(n-1, r)
")

(ptodo "accを使っているが、末尾再帰の形式になっていなにので遅い(loop版作れる？)")

(ghc #!Q
h = go where
  go xs 0 = [[]]
  go [] _ = []
  go (x:xs) n = map (x:) (go (x:xs) (n-1)) ++ go xs n
main = print $ h [1..3] 2
Q :str #t)

(p "変数accを使う場合")

(ghc #!Q
h :: [a] -> Int -> [[a]]
h = go [] where
  go acc _ 0 = [acc]
  go acc [] _ = []
  -- combinationとの違いは xsと(x:xs)の違い
  -- go acc (x:xs) n = go (x:acc) xs (n-1) ++ go acc xs n
  go acc (x:xs) n = go (x:acc) (x:xs) (n-1) ++ go acc xs n
main = print $ h [1..3] 2
Q :str #t)

(ps "nHr")

(math " {}_n H _r = {}_{n+r-1} H _r")
(p "n個のボールをr-1個の棒で仕切る並べ方に一致")
