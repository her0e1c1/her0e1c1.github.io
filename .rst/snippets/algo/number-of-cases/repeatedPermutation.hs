-- IMPLEMENT: 異なるn個の中から重複を許してr個取り出す場合の数(nPIr)
-- permutaionとの違いは、使用しても消費しない
p :: (Num a) => [a] -> Int -> [[a]]
p = go [] where
  go acc xs 0 = [acc]
  go acc xs n = concatMap (\x-> go (x:acc) xs (n-1)) xs 

main = print $ p [1..4] 2
