
find :: [Int] -> Int -> Maybe Int
find xs target = f 0 ((length xs) - 1) where
  f lo hi
    | lo > hi = Nothing
    | otherwise = g mi
    where
     mi = (lo + hi) `div` 2
     g i
       | n == target = Just i
       | lo < i && n == 0 = g (i - 1)
       | target < n       = f lo (mi - 1)  -- X < 0は失敗なので、hi側に移動する
       | otherwise        = f (mi + 1) hi
      where
         n = xs !! i  -- 0 <= i < length xs

main = do
  mapM_ (print . find [0, 1, 0, 0, 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 5, 6, 0, 7, 0, 0, 8, 9, 0]) [0..10]
