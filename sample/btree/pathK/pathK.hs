-- 2分木における経路の和がK

data Tree a = Leaf | Node a (Tree a) (Tree a)
  deriving Show

pathK :: Num a => Tree a -> a -> [[a]]
pathK n k = go n [] where
  go Leaf _ = []
  go n@(Node p l r) path = a ++ b ++ c where
    a = go l (p:path)
    b = go r (p:path)
    c = (p:path)

fromList :: [Int] -> Tree Int
fromList [] = Leaf
fromList (x:xs) = Node x (fromList ys) (fromList zs) where
  (ys, zs) = split xs

split (x:y:zs) = (x:xs, y:ys) where (xs, ys) = split(zs)
split x = (x, [])

main = do
  print $ pathK (fromList [0..6]) 6
