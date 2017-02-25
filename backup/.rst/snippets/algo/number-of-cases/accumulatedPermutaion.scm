(p "異なるn個の中から重複を許さずr個以下を取り出す場合の数(nPr (0 <= ALL r <= n))")

(math "
P(n, 0) &=& ${ $phi $}
P(0, r) &=& $phi
P(n, r) &=& ${ a_n $} $cup P(n-1,r) $cup ${cons(a_n, x) $mid x $in P(n-1, r-1) $}
")

(ghc #!Q
p :: [Int] -> Int -> [[Int]]
p = go where
 go :: [Int] -> Int -> [[Int]]
 go _  0 = [[]]
 go [] r = []
 go (x:xs) r = [x] : (go xs r) ++ [x:ys | ys<-go xs (r-1)]
main = print $ p [1,2,3] 3
Q :str #t)
