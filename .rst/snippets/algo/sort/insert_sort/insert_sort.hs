
insertSort :: (a -> a -> Ordering) -> [a] -> [a]
insertSort p [] = []
insertSort p (x:xs) = decend x $ insertSort p xs where
  decend x [] = [x]
  decend x yys@(y:ys)  -- yysはソート済み
    | p x y == LT = x:yys
    | otherwise   = y:decend x ys
