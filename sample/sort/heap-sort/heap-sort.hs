-- list version

-- MEMO:
data Heap a = Leaf | Node a [Heap a]
  deriving Show

-- MEMO:
unify :: Ord a => [Heap a] -> Heap a
unify [] = Leaf
unify [x] = x
unify (x:y:zs) = merge (merge x y) (unify zs)

-- 大きいものが上で、それより小さいものがリストとなる
-- リストの要素同士は順番ついていない
-- MEMO:
merge :: Ord a => Heap a -> Heap a -> Heap a
merge Leaf h = h
merge h Leaf = h
merge lhs@(Node l lh) rhs@(Node r rh)
  | compare l r == LT = Node l (rhs:lh)
  | otherwise         = Node r (lhs:rh)

-- MEMO:
fromList :: Ord a => [a] -> Heap a
fromList = unify . map (\x -> (Node x []))

-- MEMO:
toList :: Ord a => Heap a -> [a]
toList Leaf = []
toList (Node x xs) = x : toList (unify xs)

main = do
  print $ (toList . fromList) [4, 1, 2, 5, 3]
