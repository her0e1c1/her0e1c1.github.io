-- 異なるn個の中から、r個並べる場合の数(nPr)
permutation :: (Num a, Eq a) => [a] -> Int -> [[a]]
permutation = go [] where
  go acc _ 0  = [acc]
  go acc [] _ = []  -- fail
  go acc xs n = concatMap (\(y, ys) -> go (y:acc) ys (n-1)) $ split xs

-- 何を今までに使用したか判別するのが、多分難しい
-- [1,2,3] => [(1, [2,3]), (2, [1,3]), (3, [1,2])] のように分割
split :: [a] -> [(a, [a])]
split = go [] where
  go acc []     = []
  go acc (x:xs) = [(x, acc++xs)] ++ go (x:acc) xs

main = do
  print $ permutation [1..3] 2
  print $ length $ permutation [1..5] 3  -- 60
