
(math "
f(1) = ${ a_1 $}
f(n) = $max {f(n-1) + a_n, a_n}
")

(p "ある数列の連続した部分数列の和の最大値")

(ghc #!Q
f = go where
 go [x] = x
 go (x:xs) = max x ((go xs) + x)
main = print $ f [1,-2,1,3,2,-5,1,-4,-3,1,-2]
Q:str #t)

(p "result of a list")

(ghc #!Q
import Data.List (maximumBy)
f :: [Int] -> [Int]
f = go where
 go [x] = [x]
 go (x:xs) = maximumBy cmp [[x], (x:go xs)]
 cmp a b = compare (sum a) (sum b)
main = print $ f [1,-2,1,3,2,-5,1,-4,-3,1,-2]
Q:str #t)
