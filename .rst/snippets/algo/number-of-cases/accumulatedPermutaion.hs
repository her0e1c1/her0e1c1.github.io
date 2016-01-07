-- IMPLEMENT: 異なるn個の中から重複を許さずr個以下を取り出す場合の数(ALl nPr (0 <= r <= n))
-- TODO: wakaran

perm :: [Int] -> [[Int]]
perm = go where
  go [] = [[]]
  go xs = concatMap f (go xs) where
    f :: [Int] -> [[Int]]
    -- フリーズする
    -- f ys = map (:ys) $ filter (not . flip elem ys) xs

-- f xs ys = map (:ys) $ filter (not . flip elem ys) xs

main = do
  print $ perm [1..3]
  -- print $ f [1..5] [1..3]
