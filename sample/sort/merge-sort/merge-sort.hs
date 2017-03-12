-- MEMO:
sort :: Ord a => [a] -> [a]
sort [] = []
sort [x] = [x]
sort xs = merge (sort ys) (sort zs) where
  (ys, zs) = split xs
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xxs@(x:xs) yys@(y:ys)
  | x < y     = x:merge xs yys
  | otherwise = y:merge xxs ys

-- MEMO:
split :: [a] -> ([a], [a])  -- this is not stable
split (x:y:zs) = (x:xs, y:ys) where (xs, ys) = split zs
split xs = (xs, [])  -- after match
-- split []  = ([] , [])
-- split [x] = ([x], [])

main = do
  print $ sort [1, 4, 1, 5, 2, 3, 1]
  
