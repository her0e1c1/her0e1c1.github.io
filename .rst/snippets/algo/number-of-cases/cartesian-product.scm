
(p "集合直積")
(math "$prod_{i=0}^n A_i")

(ghc #!Q
f :: [[Int]] -> [[Int]]
f = go where
 go [] = [[]]
 go (xs:xss) = [x:ys | x<-xs, ys<-go xss] 
main = print $ f [[1,2], [3], [4,5,6]]
Q :str #t)
