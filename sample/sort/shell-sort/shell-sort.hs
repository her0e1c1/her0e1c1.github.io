
gen :: Int -> [Int]
gen x
  | x == 0 = [0]
  | otherwise = x: gen (x `div` 2)

shellSort :: [Int] -> [Int]
shellSort xs = foldl sort xs (gen $ length xs)

-- gap置きにソート(最適化のため)
sort :: [Int] -> Int -> [Int]
sort [] _ = []
-- 本来は、初期値のgapの値も0<=x<gap? 1<=x<=gapで設定する必要あり
sort (x:xs) gap = insert gap x (sort xs gap) where
  insert _ y [] = [y]
  insert g y (z:zs)
    | g /= 0 = z:insert (g-1) y zs
    | z < y = z:insert gap y zs
    | otherwise = y:z:zs

main = do
  print $ sort [3, 1, 2, 5, 4] 0
  print $ shellSort [3, 1, 2, 5, 4]
