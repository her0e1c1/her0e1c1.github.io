
(math"
k_n * a_n + k_{n-1} * a_{n-1} + ... + k_1 * a_1 = SUM
k_i >= 0, a_n > a_{n-1} > ... > a_1 > 0
s.t. $quad $min $sum_{i=1}^n k_i

使用するコインの集合を返す関数をfとおくと
f(a_n, SUM) =  [an] * k_n $cup f(a_{n-1}, SUM - a_n $times k_n)
f(a_0, X) = $phi
ただし
0 $le i $le $frac{SUM}{a_n}
$sum f(a_n, SUM) == SUM
")

(p"
この問題は、お釣りの問題に帰着できる
大きいお金を使えるだけ使って、その次にいく
ただし、失敗するかもしれない(最後が1でない場合で辻褄が合わせられない)
")

(ghc #!Q
import Data.List

solve :: [Int] -> Int -> [[Int]]
solve [] sum = [[]]
solve (c:coins) csum = concatMap (g . f) [0 .. (div csum c)]
  where
    -- xは、cにおける使用するコインの枚数
    -- fは、c:coinsにおける使用するコインのリストを返す
    f x = map ((take x (repeat c)) ++) (solve coins (csum - c * x))
    g = filter (\a-> sum a == csum)

main = do
  -- mapM print $ solve [25, 10, 5, 1] 100
  print $ Data.List.minimumBy (\a b -> compare (length a) (length b)) $ solve [25, 10, 5, 1] 100
Q :str #t)
