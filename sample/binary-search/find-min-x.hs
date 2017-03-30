-- x^2>=15241578750190521を満たす最小のxを求める
findMin :: Integer -> Integer
findMin n = foldl go (2^32) (reverse [2^i | i<-[0..32]]) where
  f x = x * x >= n
  go acc x = if f (acc - x) then acc - x else acc

main = print $ findMin 15241578750190521
