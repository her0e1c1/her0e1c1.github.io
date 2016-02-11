
(p "べき乗
Xを集合とする。 Xの部分集合全体を2^xと表す
異なるn個の中で構成される全ての組み合わせ")

(math "
f(0) &=& {$phi}
f(n) &=& ${ {a_n} $cup x $mid x $in f(n-1) $} $cup f(n-1)
")

(math "
X      &=& ${1,2,3$} のとき
2^X    &=& ${ $phi,${1$},${2$},${3$},${1,2$},${2,3$},${3,1$},${1,2,3$}$ $}
$# 2^X &=& 2^3 = {}_3 C _0 + {}_3 C _1 + {}_3 C _2 + {}_3 C _3 = 8
(つまり、 $sum_{r=0}^n {}_n C _r = 2^n)
")

(p "一つ前の結果に、新しく要素を加えるか、加えないかで分けて考える.
f(x:xs)は、[[INT]]なので、xを使う場合とそうでない場合に分ける")

(ghc "
comb :: (Num a) => [a] -> [[a]]
comb = go where
  go []    = [[]]
  go (x:xs) = map (x:) (go xs) ++ go xs
main = do
  print $ comb [1..3]
  print $ comb [1..5]
")
