(p "異なるn個の中から重複を許してr個取り出す場合の数(nHr)")

(p"同じものを使い続けるか、それを使わずに次へいくか
combinationとの違いは、使用しても消費しない")

(math "
H(n, 0) &=& ${ $phi $}
H(0, r) &=& $phi
H(n, r) &=& ${ ${a_n$} $cup x $mid x $in H(n, r-1) $} $cup H(n-1, r)
")

(ptodo "accを使っているが、末尾再帰の形式になっていなにので遅い(loop版作れる？)")

(ghc "
h = go where
  go xs 0 = [[]]
  go [] _ = []
  go (x:xs) n = [x:ys | ys<-go (x:xs) (n-1)] ++ go xs n
main = print $ h [1..3] 2
")

(ps "nHr")

(math " {}_n H _r = {}_{n+r-1} C _r")
(p "n個のボールをr-1個の棒で仕切る並べ方に一致")
