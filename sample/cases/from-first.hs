-- 最初から順番に取る場合の組み合わせ

f [] = []
f (x:xs) = [[x]] ++ [x:ys | ys <- f xs] 

g :: [a] -> [[a]]
g = foldr (\x acc -> [[x]] ++ [x:ys | ys <- acc]) []

main = do
  print $ f [1..3] -- [[1],[1,2],[1,2,3]]
  print $ f [1..5]
  print $ g [1..3]
  print $ g [1..5]
