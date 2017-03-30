-- x^2 <= 101 を満たす最大のxを求める
-- f(x) <= 0の場合に、+ 2^xを大きい方から累積する。単調増加関数である必要あり

findMax :: Integer -> Integer  -- Intは桁上がりするので不可
findMax n = foldl go 0 [2^i | i <- [32,31..0]] where
  f x = x * x <= n
  go acc x = if f (acc + x) then acc + x else acc

main = print $ findMax 101 
