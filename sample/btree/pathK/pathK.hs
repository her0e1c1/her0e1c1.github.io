-- 2分木における経路の和がK

data Tree a = Leaf | Node a (Tree a) (Tree a)
  deriving Show

pathK :: (Eq a, Num a) => Tree a -> a -> [[a]]
pathK n k = go n [] where
  go Leaf _ = []
  go n@(Node p l r) path = a ++ b ++ c where
    a = go l (p:path)
    b = go r (p:path)
    c = filter ((k==).sum) (f (p:path))

f :: [a] -> [[a]]
f = foldr (\x acc -> [[x]] ++ [x:ys | ys <- acc]) []

fromList :: [Int] -> Tree Int
fromList [] = Leaf
fromList (x:xs) = Node x (fromList ys) (fromList zs) where
  (ys, zs) = split xs

split xs = go xs xs where
  go (x:xs) (_:_:ys) = (x:us, vs) where (us, vs) = go xs ys
  go xs _ = ([], xs)

main = do
  print $ fromList [0..6]
  print $ pathK (fromList [0..6]) 6
