
(p "共通約数のみ存在する場合はTrue")

(ghc "
f :: Int -> Int -> Bool
f a b = g a where
  g x = let y = gcd x b in
    if y == 1 then x == 1 else g (div x y)
main = do
  print $ f 75 15  -- {3 5}
  print $ f 15 75
  print $ f 8 15
" :str #t)
