bubbleSort :: Ord a => [a] -> [a]
bubbleSort xs = case sort xs of
  (x:xs) -> x:bubbleSort xs
  x      -> x
  where
  sort (x:y:zs)
    | x < y     = y:sort (x:zs)
    | otherwise = x:sort (y:zs)   sort x = x
