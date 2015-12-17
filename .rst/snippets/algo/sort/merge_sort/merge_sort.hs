split :: [a] -> ([a], [a])
split (x:y:zs) = (x:xs, y:ys) where (xs, ys) = split zs
split xs = (xs, [])

mergesort :: (a -> a -> Bool) -> [a] -> [a]
mergesort pred []  = []
mergesort pred [x] = [x]
mergesort pred x   = merge (mergesort pred a) (mergesort pred b) where
  (a, b) = split x
  merge xs [] = xs
  merge [] ys = ys
  merge xxs@(x:xs) yys@(y:ys)
    | pred x y  = x:merge xs yys
    | otherwise = y:merge xxs ys
