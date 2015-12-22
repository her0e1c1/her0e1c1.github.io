-- IMPLEMENT: N Queens
canAttack :: [Int] -> Int -> Bool
canAttack queens x = go queens 1 where
  go [] _ = False
  go (q:qs) n = q == x + n || q == x - n || go qs (n + 1)

solve :: Int -> [[Int]]
solve boardSize = go [] where
  go queens = if (length queens) == boardSize
              then [queens]
              else concatMap (go . flip (:) queens) $ filter f [0 .. (boardSize - 1)]
    where
      f x = not $ (elem x queens) || (canAttack queens x) 

main = do
  print $ solve 4
