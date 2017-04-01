-- Lowest Common Ancestor (Without Addtional Memory)

data Tree a = Leaf | Node a (Tree a) (Tree a)
  deriving Show

-- rootから順にa,bを持つかどうか調べる
-- ただしnodeの値はuniqueであることが条件
lca :: Ord a => Tree a -> Tree a -> Tree a -> Maybe (Tree a)
lca Leaf a b = Nothing
lca n@(Node c l r) a b
  | (hasNode l a) && (hasNode l b) = lca l a b
  | (hasNode r a) && (hasNode r b) = lca r a b
  | otherwise = Just n

hasNode :: Ord a => Tree a -> Tree a -> Bool
hasNode Leaf _ = False 
hasNode n1@(Node a1 l r) n2@(Node a2 _ _)
  | a1 == a2 = True
  | otherwise = (hasNode l n2) || (hasNode r n2)

fromList :: [Int] -> Tree Int
fromList [] = Leaf
fromList (x:xs) = Node x (fromList ys) (fromList zs) where
  (ys, zs) = split xs

split (x:y:zs) = (x:xs, y:ys) where (xs, ys) = split(zs)
split x = (x, [])

main = do
  print $ lca (fromList [0..15]) (Node 8 Leaf Leaf) (Node 13 Leaf Leaf)
  print $ lca (fromList [0..15]) (Node 8 Leaf Leaf) (Node 12 Leaf Leaf)
