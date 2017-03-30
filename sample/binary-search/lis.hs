-- longest-increasing-subsequence O(n^2)
import Data.List (maximumBy)

lis :: [Int] -> [Int]
lis = g where
 c a b = compare (length a) (length b)
 -- g [] = []
 g (x:xs) = x : maximumBy c (map (h . flip drop xs) [0..(length xs)]) where
  h [] = []
  h ys = if head ys > x then g ys else []

main = do
  print $ lis [3,2,5,1,3,1,7,4]  -- [3, 5, 7]
  print $ lis [1,3,2,5,4,5,6]  -- [1,2,4,5,6]