
f [] = []
f xs = f (take (length ys - 1) ys) ++ [last ys] where
 ys = g xs

g (x:y:zs)
 | x < y     = x:g (y:zs)
 | otherwise = y:g (x:zs)
g x = x

main = print $ f [3,1,2,5,4]
