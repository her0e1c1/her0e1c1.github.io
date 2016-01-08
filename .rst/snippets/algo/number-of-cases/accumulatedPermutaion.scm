(p "異なるn個の中から重複を許さずr個以下を取り出す場合の数(nPr (0 <= ALL r <= n))")

(ghc #!Q
p :: [Int] -> Int -> [[Int]]
p = go where
 go :: [Int] -> Int -> [[Int]]
 go _  0 = [[]]
 go [] r = []
 go (x:xs) r = [x] : (go xs r) ++ [x:ys | ys<-go xs (r-1)]
main = print $ p [1,2,3] 3
Q :str #t)
