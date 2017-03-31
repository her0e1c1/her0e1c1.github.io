-- 異なるn個のn個以下の組み合わせ

comb :: Num a => [a] -> [[a]]
comb = go where
  go [] = [[]]  -- WARN: go [] = []
  go (x:xs) = go xs ++ [x:ys|ys<-go xs]

main = do
  print $ comb [1..3] -- [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
  print $ comb [1..5]
