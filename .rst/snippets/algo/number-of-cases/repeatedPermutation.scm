(p "異なるn個の中から重複を許してr個取り出す場合の数(nPIr)")
(p "permutaionとの違いは、使用しても消費しない")

(math "
PI(n, 0) &=& ${ $phi $}
PI(n, r) &=& ${cons(a_i, x) $mid x $in PI(n, r-1), 1 $le i $le n $}
")

(ghc #!Q
p :: (Num a) => [a] -> Int -> [[a]]
p = go where
  go xs 0 = [[]]
  go xs n = [x:ys | x<-xs, ys<-go xs (n-1)]
main = print $ p [1..4] 2
Q :str #t)
