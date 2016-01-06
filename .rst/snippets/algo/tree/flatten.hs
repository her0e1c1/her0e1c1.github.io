
-- squishの第二引数は結果を保持
data Tree a = Node a [Tree a] deriving Show
flatten :: Tree a -> [a]
flatten t = squish t []
  where squish (Node x ts) xs = x:foldr squish xs ts