
(pw "ある数列の連続した部分数列の和の最大値")

(math "
f(i) = ($mbox{iにおける最大}, $mbox{iにおける総和}) = (m_i, s_i)
s_0 = m_0 = 0
s_i = $max ${ 0, s_{i-1} + a_i $}
m_i = $max ${ m_{i-1}, s_i $}
")

(ghc #!Q
f = go 0 0 where
 go s m [] = m
 go s m (x:xs) = go y n xs where
  y = max (s + x) 0
  n = max m y
main = do
 print $ f [0,4,-6,2,3]
 print $ f [1,-2,1,3,2,-5,1,-4,-3,1,-2]
Q:str #t :msg "大きい負の数が来たら、足さずに0から再度開始")

(ghc #!Q
s :: [Int] -> Int
s [] = 0
s (x:xs) = max 0 (x + s xs)
m :: [Int] -> Int
m [] = 0
m (x:xs) = max (m xs) (s $ x:xs)
main = do
 print $ m [0,4,-6,2,3]
 print $ m [1,-2,1,3,2,-5,1,-4,-3,1,-2]
Q:str #t)

(ghc #!Q
import Data.List (maximumBy)
c a b = compare (sum a) (sum b)
s [] = []
s (x:xs) = maximumBy c [[], (x:(s xs))]
m [] = []
m (x:xs) = maximumBy c [(m xs), (s(x:xs))]
main = do
 print $ m [0,4,-6,2,3]
 print $ m [1,-2,1,3,2,-5,1,-4,-3,1,-2]
Q:str #t :msg "result of a list")
