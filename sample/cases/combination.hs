-- 異なるn個からr個取り出す組み合わせ(nCr)

comb :: (Num a) => [a] -> Int -> [[a]]
comb = go where
  go _ 0      = [[]]  -- 先頭に記述すること
  go [] _     = []
  go (x:xs) n = [x:ys | ys <- go xs (n-1)] ++ go xs n

main = do
  print $ comb [1..3] 2 -- [[1,2],[1,3],[2,3]]
  print $ comb [1..5] 4
